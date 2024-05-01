module ReadCsv;

    parameter ARRAY_SIZE = 784; // Define the size of the array

    reg [7:0] csv_array[ARRAY_SIZE-1:0][15:0]; // Array to store the CSV values

    integer file;
    integer i, j;
    integer value;

    initial begin
        
        file = $fopen("../../../../../extracted weights from python program/hidden_layer1_weights_int.csv", "r"); // Open the CSV file for reading

        if (file == 0) begin
            $display("Error opening file");
            $finish;
        end

        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                if ($fscanf(file, "%d,", value) == 1) begin
                    csv_array[i][j] = value;
                end else begin
                    $display("Error reading value at line %0d, column %0d", i, j);
                    $fclose(file);
                    $finish;
                end
            end
        end
    end

endmodule

