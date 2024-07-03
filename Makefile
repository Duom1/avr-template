SOURCES = main.c
OBJS = $(SOURCES:.c=.o)
NAME = prog
PORT = /dev/ttyACM0

.PHONY: burn clean

default: $(NAME).hex
def: $(NAME).hex

$(NAME).hex: $(NAME).bin
	avr-objcopy -O ihex -R .eeprom $^ $@

$(NAME).bin: $(OBJS)
	avr-gcc -o $@ $^

%.o: %.c
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o $@ $<

burn: $(NAME).hex
	avrdude -F -V -c arduino -p ATMEGA328P -P $(PORT) -b 115200 -U flash:w:$(NAME).hex

clean:
	rm -f $(OBJS) $(NAME).bin $(NAME).hex
