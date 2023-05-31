program temperature_conversion
    implicit none
    character(len=100) :: input_file
    character(len=100) :: output_file
    real :: celsius, kelvin
    integer :: i
    logical :: end_of_file
    
    ! Define the input and output filenames
    input_file = "KelvinValues.csv"
    output_file = "8671321_Air-Temperature-Assignment1.csv"
    
    ! Open the input and output files
    open(unit=10, file=input_file, status='old', action='read')
    open(unit=20, file=output_file, status='new', action='write')
    
    ! Read the temperature values and convert to Kelvin
    end_of_file = .false.
    do while (.not. end_of_file)
        read(10, *, iostat=i) celsius
        if (i /= 0) then
            end_of_file = .true.
        else
            kelvin = celsius + 273.15
            write(20, '(F8.2)') kelvin
        end if
    end do
    
    ! Close the input and output files
    close(10)
    close(20)
    
    write(*, *) "Values successfully converted!"
    
end program temperature_conversion

