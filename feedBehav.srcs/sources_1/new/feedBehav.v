`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 11:20:23 PM
// Design Name: 
// Module Name: feedBehav
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module feedBehav(
    input prdtr,
    input hngr,
    input clk,
    input chld_danger,
    output reg chld_danger_led,
    output reg attack,
    output reg prdtr_led,
    output reg hngr_led,
    output reg run,
    output reg care,
    output reg feed
    );
    
always @(posedge clk)
begin
    
    if (prdtr==1)
        begin
            prdtr_led=1;
            
            if (chld_danger==1)
            begin
                chld_danger_led=1;
                run=0;
                attack=1;
            end
            
            else if (chld_danger==0)
            begin
                chld_danger_led=0;
                run=1;
                attack=0;
            end
        end
        
    else
        begin
            prdtr_led=0;
            run=0;
            attack=0;
        end
end

always @(posedge clk)
begin
    if (hngr==1)
        begin
            hngr_led=1;
            care=0;
            
            if(prdtr==0)
            begin
                feed=1;
            end
            
            else
            begin
                feed=0;
            end
        end
        
    else
        begin
            hngr_led=0;
            feed=0;
            
            if(prdtr==0)
            begin
                care=1;
            end
            else
            begin
                care=0;
            end
        end
end


endmodule
