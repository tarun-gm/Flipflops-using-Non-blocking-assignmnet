# EXPERIMENT 3B: Simulation of All Flip-Flops using Non Blocking Statement

## AIM
To design and simulate basic flip-flops (SR, D, JK, and T) using **Non blocking statements** in Verilog HDL, and verify their functionality through simulation in Vivado 2023.1.

## APPARATUS REQUIRED
- Vivado 2023.1
- Computer with HDL Simulator

## DESCRIPTION
Flip-flops are the basic memory elements in sequential circuits.  
In this experiment, different types of flip-flops (SR, D, JK, T) are modeled using **behavioral modeling** with **Non blocking assignment (`<=`)** inside the `always` block.  
Non Blocking assignments execute sequentially in the given order, which makes it easier to describe simple synchronous circuits.

## PROCEDURE
1. Open **Vivado 2023.1**.  
2. Create a **New RTL Project** (e.g., `FlipFlop_Simulation`).  
3. Add Verilog source files for each flip-flop (SR, D, JK, T).  
4. Add a testbench file to verify all flip-flops.  
5. Run **Behavioral Simulation**.  
6. Observe waveforms of inputs and outputs for each flip-flop.  
7. Verify that outputs match the truth table.  
8. Save results and capture simulation screenshots.

---

## VERILOG CODE

### SR Flip-Flop (Non Blocking)
```
module srff(
    input clk,
    input S,
    input R,
    output reg Q
);

    always @(posedge clk) begin
        case ({S,R})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= 1'bx;
            default: Q <= Q;
        endcase
    end

endmodule

```
### SR Flip-Flop Test bench 
```
module srff_tb;
  reg clk, S, R;
  wire Q;

  srff dut(.clk(clk), .S(S), .R(R), .Q(Q));

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    S = 0; R = 0;
    #100 S = 1; R = 0;
    #100 S = 0; R = 0;
    #100 S = 0; R = 1;
    #100 S = 1; R = 1;
    #100 S = 0; R = 0;
  end
endmodule
```
#### SIMULATION OUTPUT
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/e9ee2613-831e-4ddf-b0e3-02ff5d516bef" />


### JK Flip-Flop (Non Blocking)
```
module jkff(
    input clk,
    input rst,
    input J,
    input K,
    output reg Q
);

    always @(posedge clk) begin
        if (rst)
            Q <= 0;
        else begin
            case ({J,K})
                2'b00: Q <= Q;
                2'b01: Q <= 0;
                2'b10: Q <= 1;
                2'b11: Q <= ~Q;
                default: Q <= Q;
            endcase
        end
    end

endmodule

```
### JK Flip-Flop Test bench 
```
module jkff_tb;
    reg clk_t, rst_t, J_t, K_t;
    wire Q_t;

    jkff dut(.clk(clk_t), .rst(rst_t), .J(J_t), .K(K_t), .Q(Q_t));

    initial begin
        clk_t = 1'b0;
        rst_t = 1'b1;
        #20 rst_t = 1'b0;
        J_t = 1'b0; K_t = 1'b0;
        #20 J_t = 1'b0; K_t = 1'b1;
        #20 J_t = 1'b1; K_t = 1'b0;
        #20 J_t = 1'b1; K_t = 1'b1;
    end

    always #10 clk_t = ~clk_t;

endmodule

```
#### SIMULATION OUTPUT
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/5df230ef-9aee-46b3-995e-3bee7495d266" />

### D Flip-Flop (Non Blocking)
```

module dff(
    input clk,
    input rst,
    input d,
    output reg dout
);

    always @(posedge clk) begin
        if (rst)
            dout <= 1'b0;
        else
            dout <= d;
    end

endmodule

```
### D Flip-Flop Test bench 
```
module dff_tb;
    reg clk_t, rst_t, d_t;
    wire dout_t;

    dff dut(.clk(clk_t), .rst(rst_t), .d(d_t), .dout(dout_t));

    initial begin
        clk_t = 1'b0;
        rst_t = 1'b1;
        #20 rst_t = 1'b0;
        d_t = 1'b0;
        #20 d_t = 1'b1;
    end

    always #10 clk_t = ~clk_t;

endmodule

```

#### SIMULATION OUTPUT
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/d81668d2-dcba-4a14-822b-dd21afdb95bd" />

### T Flip-Flop (Non Blocking)
```verilog
module d_ff (
    input wire d,clk,
    output reg Q
);
    always @(posedge clk) begin



endmodule
```
### T Flip-Flop Test bench 
```verilog



```

#### SIMULATION OUTPUT

------- paste the output here -------

---

### RESULT

All flip-flops (SR, D, JK, T) were successfully simulated using Non blocking statements in Verilog HDL.
The outputs matched the expected truth table values, demonstrating correct sequential behavior.
