#include <avr/io.h>

int main(void) {
  DDRB |= (1 << DDB5);
  PORTB |= (1 << PORTB5);
  while (1) {
  }
}
