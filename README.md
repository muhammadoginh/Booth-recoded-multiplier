# Booth-recoded multiplier design
This project contain implementation of 16bit $\times$ 16bit 2-level piplelined booth-recoided multiplier

Component:
- Carry-save array in array block
- carry look-ahead adder, square root carry select adder in final adder

### Modified booth's recoding (radix-4 booth recoding)

| $$Y_{i+1}$$ | $$Y_{i}$$ | $$Y_{i-1}$$ | $$Z_{i+1}$$ | $$Z_{i}$$ | Recoded bits |
| :---------: | :-------: | :---------: | :---------: | :-------: | :----------: |
| 0           | 0         | 0           | 0           | 0         | 0            |
| 0           | 0         | 1           | 0           | 1         | +X           |
| 0           | 1         | 0           | 0           | 1         | +X           |
| 0           | 1         | 1           | 1           | 0         | +2X          |
| 1           | 0         | 0           | 1           | 0         | -2X          |
| 1           | 0         | 1           | 0           | 1         | -X           |
| 1           | 1         | 0           | 0           | 1         | -X           |
| 1           | 1         | 1           | 0           | 0         | 0            |