<#
.SYNOPSIS
    Sample control for UniversalDashboard.
.DESCRIPTION
    Sample control function for UniversalDashboard. This function must have an ID and return a hash table.
.PARAMETER Id
    An id for the component default value will be generated by new-guid.
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function New-UDTimeLineData {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RowLabel,

        [Parameter(Mandatory = $false)]
        $BarLabel = $null,

        [Parameter(Mandatory = $false)]
        $Tooltip = $null,

        [Parameter(Mandatory = $true)]
        [DateTime]$Start,

        [Parameter(Mandatory = $true)]
        [DateTime]$End,

        [Parameter(Mandatory = $false)]
        $Color
    )

    End {
        [PSCustomObject]@{
            RowLabel    = $RowLabel
            BarLabel   = $BarLabel
            Tooltip   = $Tooltip

             #https://developers.google.com/chart/interactive/docs/datesandtimes#dates-and-times-using-the-date-string-representation
                #Important: When using this Date String Representation, as when using the new Date() constructor, months are indexed starting at zero (January is month 0, December is month 11).
            Start   = "Date($($Start.Year), $($Start.Month - 1), $($Start.Day), $($Start.Hour), $($Start.Minute), $($Start.Second), $($Start.Millisecond))"
            End   = "Date($($End.Year), $($End.Month - 1), $($End.Day), $($End.Hour), $($End.Minute), $($End.Second), $($End.Millisecond))"
            Color   = $Color
        }

    }
}
