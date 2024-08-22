version 1.0

task Adder {
    input {
        Int a
        Int b
    }

    command <<<
        expr ~{a} + ~{b}
    >>>

    runtime {
        memory: "1 GiB"
        docker: "ubuntu:bionic"
        disks: "local-disk 1GiB HDD"
        cpu: 1
    }

    output {
        Int sum = read_int(stdout())
    }
}

workflow Sum {
    input {
        Int a
        Int b
    }

    call Adder {
        input:
            a = a,
            b = b
    }

    output {
        Int sum = Adder.sum
    }
}
