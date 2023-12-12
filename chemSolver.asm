#############################################################################
# Assignment: 	Final Project - Chemical Analysis
#     Course:	CMPEN 351 Microprocessors, Summer 2023, PSU World Campus
#       Date: 	Sunday, August 6th, 2023
#     Author: 	Michael M. Shires
# 
#There are multiple current limitations. To start with, each chemical formula
#can have a maximum character length of 15 characters, and there can only be a
#maximum of 8 unique elements used in the complete reaction. This is done to
#make allocating memory for the array easier. While technically the array only
#requires an amount of rows equal to the number of reactants and products
#combined to be a wholly restricted system of equations, all elements are
#balanced to ensure that the solution is proper.
##############################################################################

.data

  #Format is symbol in two char's, number, and mass.
ElementTable:
  .word       'H', 0, 1, 1008
  .asciiz     "Hydrogen       "
  .word       'H', 'e', 2, 4002
  .asciiz     "Helium         "
  .word       'L', 'i', 3, 6940
  .asciiz     "Lithium        "
  .word       'B', 'e', 4, 9012
  .asciiz     "Beryllium      "
  .word       'B', 0, 5, 10810
  .asciiz     "Boron          "
  .word       'C', 0, 6, 12011
  .asciiz     "Carbon         "
  .word       'N', 0, 7, 14007
  .asciiz     "Nitrogen       "
  .word       'O', 0, 8, 15999
  .asciiz     "Oxygen         "
  .word       'F', 0, 9, 18998
  .asciiz     "Fluorine       "
  .word       'N', 'e', 10, 20180
  .asciiz     "Neon           "
  .word       'N', 'a', 11, 22990
  .asciiz     "Sodium         "
  .word       'M', 'g', 12, 24305
  .asciiz     "Magnesium      "
  .word       'A', 'l', 13, 26982
  .asciiz     "Aluminum       "
  .word       'S', 'i', 14, 28085
  .asciiz     "Silicon        "
  .word       'P', 0, 15, 30974
  .asciiz     "Phosphor       "
  .word       'S', 0, 16, 32060
  .asciiz     "Sulfur         "
  .word       'C', 'l', 17, 35450
  .asciiz     "Chlorine       "
  .word       'A', 'r', 18, 39948
  .asciiz     "Argon          "
  .word       'K', 0, 19, 39098
  .asciiz     "Potassium      "
  .word       'C', 'a', 20, 40078
  .asciiz     "Calcium        "
  .word       'S', 'c', 21, 44956
  .asciiz     "Scandium       "
  .word       'T', 'i', 22, 47867
  .asciiz     "Titanium       "
  .word       'V', 0, 23, 50942
  .asciiz     "Vanadium       "
  .word       'C', 'r', 24, 51996
  .asciiz     "Chromium       "
  .word       'M', 'n', 25, 54938
  .asciiz     "Manganese      "
  .word       'F', 'e', 26, 55845
  .asciiz     "Iron           "
  .word       'C', 'o', 27, 58933
  .asciiz     "Cobalt         "
  .word       'N', 'i', 28, 58693
  .asciiz     "Nickel         "
  .word       'C', 'u', 29, 63546
  .asciiz     "Copper         "
  .word       'Z', 'n', 30, 65380
  .asciiz     "Zinc           "
  .word       'G', 'a', 31, 69723
  .asciiz     "Gallium        "
  .word       'G', 'e', 32, 72630
  .asciiz     "Germanium      "
  .word       'A', 's', 33, 74922
  .asciiz     "Arsenic        "
  .word       'S', 'e', 34, 78971
  .asciiz     "Selenium       "
  .word       'B', 'r', 35, 79904
  .asciiz     "Bromine        "
  .word       'K', 'r', 36, 83798
  .asciiz     "Krypton        "
  .word       'R', 'b', 37, 85468
  .asciiz     "Rubidium       "
  .word       'S', 'r', 38, 87620
  .asciiz     "Strontium      "
  .word       'Y', 0, 39, 88906
  .asciiz     "Yttrium        "
  .word       'Z', 'r', 40, 91224
  .asciiz     "Zirconium      "
  .word       'N', 'b', 41, 92906
  .asciiz     "Niobium        "
  .word       'M', 'o', 42, 95950
  .asciiz     "Molybdenum     "
  .word       'T', 'c', 43, 98000
  .asciiz     "Technetium     "
  .word       'R', 'u', 44, 101070
  .asciiz     "Ruthenium      "
  .word       'R', 'h', 45, 102910
  .asciiz     "Rhodium        "
  .word       'P', 'd', 46, 106420
  .asciiz     "Palladium      "
  .word       'A', 'g', 47, 107870
  .asciiz     "Silver         "
  .word       'C', 'd', 48, 112410
  .asciiz     "Cadmium        "
  .word       'I', 'n', 49, 114820
  .asciiz     "Indium         "
  .word       'S', 'n', 50, 118710
  .asciiz     "Tin            "
  .word       'S', 'b', 51, 121760
  .asciiz     "Antimony       "
  .word       'T', 'e', 52, 127600
  .asciiz     "Tellurium      "
  .word       'I', 0, 53, 126900
  .asciiz     "Iodine         "
  .word       'X', 'e', 54, 131290
  .asciiz     "Xenon          "
  .word       'C', 's', 55, 132910
  .asciiz     "Cesium         "
  .word       'B', 'a', 56, 137330
  .asciiz     "Barium         "
  .word       'L', 'a', 57, 138910
  .asciiz     "Lanthanum      "
  .word       'C', 'e', 58, 140120
  .asciiz     "Cerium         "
  .word       'P', 'r', 59, 140910
  .asciiz     "Praesodymium   "
  .word       'N', 'd', 60, 144240
  .asciiz     "Neodymium      "
  .word       'P', 'm', 61, 145000
  .asciiz     "Promethium     "
  .word       'S', 'm', 62, 150360
  .asciiz     "Samarium       "
  .word       'E', 'u', 63, 151960
  .asciiz     "Europium       "
  .word       'G', 'd', 64, 157250
  .asciiz     "Gadolinium     "
  .word       'T', 'b', 65, 158930
  .asciiz     "Terbium        "
  .word       'D', 'y', 66, 162500
  .asciiz     "Dysprosium     "
  .word       'H', 'o', 67, 164930
  .asciiz     "Holmium        "
  .word       'E', 'r', 68, 167260
  .asciiz     "Erbium         "
  .word       'T', 'm', 69, 168930
  .asciiz     "Thulium        "
  .word       'Y', 'b', 70, 173050
  .asciiz     "Ytterbium      "
  .word       'L', 'u', 71, 174970
  .asciiz     "Lutetium       "
  .word       'H', 'f', 72, 178490
  .asciiz     "Hafnium        "
  .word       'T', 'a', 73, 180950
  .asciiz     "Tantalum       "
  .word       'W', 0, 74, 183840
  .asciiz     "Tungsten       "
  .word       'R', 'e', 75, 186210
  .asciiz     "Rhenium        "
  .word       'O', 's', 76, 190230
  .asciiz     "Osmium         "
  .word       'I', 'r', 77, 192220
  .asciiz     "Iridium        "
  .word       'P', 't', 78, 195080
  .asciiz     "Platinum       "
  .word       'A', 'u', 79, 196970
  .asciiz     "Gold           "
  .word       'H', 'g', 80, 200590
  .asciiz     "Mercury        "
  .word       'T', 'l', 81, 204380
  .asciiz     "Thallium       "
  .word       'P', 'b', 82, 207200
  .asciiz     "Lead           "
  .word       'B', 'i', 83, 208980
  .asciiz     "Bismuth        "
  .word       'P', 'o', 84, 209000
  .asciiz     "Polonium       "
  .word       'A', 't', 85, 210000
  .asciiz     "Astatine       "
  .word       'R', 'n', 86, 222000
  .asciiz     "Radon          "
  .word       'F', 'r', 87, 223000
  .asciiz     "Francium       "
  .word       'R', 'a', 88, 226000
  .asciiz     "Radium         "
  .word       'A', 'c', 89, 227000
  .asciiz     "Actinium       "
  .word       'T', 'h', 90, 232040
  .asciiz     "Thorium        "
  .word       'P', 'a', 91, 231040
  .asciiz     "Protactinium   "
  .word       'U', 0, 92, 238030
  .asciiz     "Uranium        "

  HelloPrompt:
    .asciiz   "Welcome to the chemical equation balancer.\n"

  ReacPrompt:
    .asciiz   "How many reactants are there?\n"

  ProdPrompt:
    .asciiz   "How many products are there?\n"

  NamePrompt:
    .ascii    "\nChemical formulae can be no longer that 15 characters,\n"
    .asciiz   "coefficients included, and no more than 8 terms per formula.\n"

  ReacNamePrompt:
    .asciiz   "What is the chemical equation for reactant "

  ProdNamePrompt:
    .asciiz   "What is the chemical equation for product "

  ErrorPrompt:
    .asciiz   "\nSomething went wrong. Exitting the program.\n"

  qMark:
    .asciiz   "?\n"

  Arrow:
    .asciiz   " -> "

  Plus:
    .asciiz   " + "

  UniqueElementsArray:
    .word     0 : 16

  argSize:    #Total number of reactants and products. Need for matrix math.
    .word     0

  #Necessary for GCD'ing the matrix. Kind of cheating, but assume no
  #coefficient greater than 255, and therefore need only primes below the sqrt
  #of 256, or 16. We also use the fact that there are precisely 6 to our
  #advantage, so an index of primes is not needed to traverse this list.
  Primes:
    .word      2, 3, 5, 7, 11, 13

  #Store the address of a 1-D array of all the coefficients after they've been
  #determined.
  CoefficientAddr:
    .byte     0

.text
# Main
  
  jal   GetInput        #
  move  $s0, $v0        # s0 holds num reactants
  move  $s1, $v1        # s1 holds num products
  add   $s3, $s0, $s1   # s3  contains total number of products and reactants.
  sw    $s3, argSize    #Now argSize also holds total number.
  add   $a0, $s0, $s1   #load total number of args for allocation.
  jal   MemAllocStringArray#
  move  $s2, $v0        # s2 holds pointer to reactants and products array.
  move  $a0, $s0        #
  la    $a1, ReacNamePrompt#
  move  $a2, $s2        #
  jal   GetNames        #

  move  $a0, $s1        #
  la    $a1, ProdNamePrompt#
  sll   $a2, $s0, 5     #
  add   $a2, $s2, $a2   #
  jal   GetNames        #

  move  $a0, $s2        #
  move  $a1, $s3        #
  jal   ParseArray      # Parse the reactants and products array.
  
  move  $a0, $s3        #
  jal   MemAllocCoefficientMatrix#
  move  $s4, $v0        #s4 holds the address of the ID matrix.
  
  move  $a0, $s4        #Coefficient matrix.
  move  $a1, $s2        #
  move  $a2, $s3        #
  jal   PopulateArray   #
  
  move  $a0, $s4        #
  lw    $a1, UniqueElementsArray# Loads the # of rows (aka unique elements).
  move  $a2, $s0        #No. of reactants.
  move  $a3, $s1        #No. of products.
  jal   NegateProducts  #
  
  move  $a0, $s4        #Addr of coefficient matrix.
  lw    $a1, UniqueElementsArray# Loads the # of rows (aka unique elements).
  move  $a2, $s3        #number of columns.
  jal   SimplifyArray   #
  
  move  $a0, $s4        #addr of coefficient matrix.
  jal   StoreCoefficients#
  
  move  $a0, $s2        #addr of string matrix.
  move  $a1, $s3        #number of reactantsand products.
  jal   ClearNewlines
  
  move  $a0, $s2        #addr of string matrix.
  move  $a1, $s0        #number of reactants.
  move  $a2, $s1        #number of products.
  jal PrintBalancedEqn  #
  
# End
exit:
  li    $v0, 10         #Load the exit syscall code, and
  syscall               #exit the program.

##############################################################################
############################ P R O C E D U R E S #############################
##############################################################################


#Procedure: GetInput
#
#Get's input from the user.
#
#Output: $v0 number of reactants.
#
#Output: $v1 number of products.

GetInput:
  la    $a0, ReacPrompt #
  li    $v0, 4          #
  syscall               #
  li    $v0, 5          #
  syscall               #
  move  $t0, $v0        #
  la    $a0, ProdPrompt #
  li    $v0, 4          #
  syscall               #
  li    $v0, 5          #
  syscall               #
  move  $v1, $v0        #
  move  $v0, $t0        #
  jr    $ra             #

#Procedure: MemAllocStringArray
#
#Alloc the necessary size for one large array containing two 16 byte rows for
#each reactant and product.
#
#Input: $a0 size of array (total number of reactants and products).
#
#Output: $v0 address of array.

MemAllocStringArray:
  sll,  $a0, $a0, 5     #multiply by 16 for each row of the array. again by 2
  li    $v0, 9          #b/c each row has an empty row beneath it for the 
  syscall               #parsed version of the formula.
  jr    $ra             #


#Procedure:GetNames
#
#Allocate memory for chemical formula names, and read them from the user.
#Forms an array 16 bytes long and allocates to rows for each name, one for the
#input string and the row directly below it is for the parsed version.
#
#Input: $a0 Number of names to receive.
#
#Input: $a1 address of prompt to give user.
#
#Input: $a2 address of array to fill.

GetNames:
  addiu $sp, $sp, -12   #
  sw    $s0, 0($sp)     #
  sw    $s1, 4($sp)     #
  sw    $s2, 8($sp)     #
  move  $s0, $a2        #
  move  $s1, $a1        #
  move  $t0, $a0        #copies the arg for incrementing the loop later.
  la    $a0, NamePrompt #
  li    $v0, 4          #
  syscall               #
  move  $t1, $zero      #
GetNamesLoop:
  addiu $t1, $t1, 1     #
  move  $a0, $s1        #load the addr of desired print.
  li    $v0, 4          #
  syscall
  move  $a0, $t1        #
  li    $v0, 1          #
  syscall               #
  la    $a0, qMark      #
  li    $v0, 4          #
  syscall
  
  li    $a1, 16         #
  li    $v0, 8          #
  move  $a0, $s0        #
  syscall               #
  addiu $s0, $s0, 32    #Skip the next row in array.
  bne   $t0, $t1 GetNamesLoop#

  move  $v0, $s2        #
  lw    $s0, 0($sp)     #
  lw    $s1, 4($sp)     #
  lw    $s2, 8($sp)     #
  addiu $sp, $sp, 12    #
  jr    $ra


#Procedure: ParseArray
#
#Accepts an array and the size of the array, and parses the inputs in the
#upper level into coefficients and unique variables on the lower level of each
#row.
#
#Input: $a0 address of array initialized with an empty row below each filled
#           in string input.
#
#Input: $a1 number of inputs in the array.

ParseArray:
  addiu $sp, $sp, -16   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  move  $s0, $a0        #
  move  $s1, $a1        #
  move  $s2, $zero      #
  ParseArrayLoop:
  move  $a0, $s0        #
  move  $a1, $s2        #
  jal   ParseString
  addiu $s2, $s2, 1     #
  bne   $s1, $s2, ParseArrayLoop#
  
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  addiu $sp, $sp, 16    #
  jr    $ra


#Procedure: ParseString
#
#Parses all the input on a specific row of the array to the row below it.
#
#Input: $a0 address of input array.
#
#Input: $a1 row to parse.

ParseString:
  addiu $sp, $sp, -16   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  
  move  $s1, $a1        #Saves the row ID.
  sll   $t1, $s1, 5     #Mul's ID by 32 and adds to address to shift to the
  add   $s0, $a0, $t1   #right row.
  add   $s2, $s0, 16    #Stores the working address of the parsed row.

  lb    $a0, 0($s0)     #loads the first character
ParseStringLoop:
  lb    $a1, 1($s0)     #
  bgt   $a1, 96, ParseStringElementFinder#means second letter is part of elem.
  li    $a1, 0          #This is if second letter is not lower case.
  addiu $s0, $s0, -1    #b/c later we assume two letter and add two.
ParseStringElementFinder:
  jal   ElementFinder   #
  sb    $v0, 0($s2)     # Loads the element ID, and increments the
  addiu $s2, $s2, 1     # counter by 1.
  addiu $s0, $s0, 2     #Offset by a two character ID. b/c of the -1 preset
                        #earlier, this works for both one and two letter IDs.

  lb    $a0, 0($s0)     #
  beq   $a0, 10, ParseStringCoefficientOne#
  addiu $a0, $a0, -48   #offset from ascii int's to actual ints.
  blt   $a0, 10, ParseStringStoreNum#
ParseStringCoefficientOne:
  li    $a0, 1          #If no coefficient, assume 1.
  addiu $s0, $s0, -1    #b/c later we assume a coefficient.
ParseStringStoreNum:
  sb    $a0, 0($s2)     #Loads the element ID, and increments the
  addiu $s2, $s2, 1     #counter by 1.
  addiu $s0, $s0, 1     #Offset for the one character number.
  lb    $a0, 0($s0)     #
  beq   $a0, 10, ParseStringComplete#
  j     ParseStringLoop #
ParseStringComplete:
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  addiu $sp, $sp, 16    #
  jr    $ra


#Procedure: AddValue
#
#Add either a coefficient or an element ID to the input array.
#
#Input: $a0 address of input array.
#
#Input: $a1 which input (row) to add the value.
#
#Input: $a2 the desired value to add to the array.

AddValue:
  addiu $a0, $a0, 16    #
  sll   $a1, $a1, 5     #
  add   $a0, $a0, $a1   #

AddValueLoop:
  lb    $t0, 0($a0)     #
  beq   $t0, $zero, AddValueSuccess
  addiu $a0, $a0, 1     #
  j     AddValueLoop
AddValueSuccess:
  sb    $a2, 0($a0)     #
  jr    $ra


#Procedure: ElementFinder
#
#Returns an element ID when passed two letters. Returns 0 if no element is
#found. If the element has only one letter in it's abbreviation, then pass
#zero for the second argument.
#
#Input: $a0 first character to match to an element.
#
#Input: $a1 second character to match to an element. Pass zero if no second
#           element.
#
#Output: $v0 integer ID of element. Returns 0 if the element is invalid.

ElementFinder:
  addiu $sp, $sp, -4    #
  sw    $ra, 0($sp)     #
  la    $t0, ElementTable#
  li    $t2, 1          #
ElementFinderFirstLoop:
  lb    $t1, 0($t0)     #
  bne   $a0, $t1, ElementFinderNotMatch#
  lb    $t1, 4($t0)     #
  beq   $a1, $t1, ElementFinderSuccess#
ElementFinderNotMatch:
  addiu $t0, $t0, 32    #
  addiu $t2, $t2, 1     #
  blt   $t2, 94, ElementFinderFirstLoop#
  li    $v0, 0          #
  jr    $ra             #

ElementFinderSuccess:
  lb    $a0, 8($t0)     #
  jal   UniqueElementCheck#
  move  $v0, $a0        #
  
  lw    $ra, 0($sp)     #
  addiu $sp, $sp, 4     #
  jr    $ra             #


#Procedure: UniqueElementCheck
#
#Checks if an element has been seen yet this run through. If so, add it to the
#unique element array.
#
#Input: $a0 element ID to check against the array. Adds and increments the
#           counter.

UniqueElementCheck:
  la    $t0, UniqueElementsArray#
  move  $t1, $zero      #
  lw    $t2, 0($t0)     #loads the index into t2.
  beqz  $t2, UniqueElementCheck_AddElem#
UniqueElementCheckLoop:
  addiu $t0, $t0, 4     #
  lw    $t3, 0($t0)     #
  beq   $t3, $a0, UniqueElementCheck_ElemExists#
  addiu $t1, $t1, 1     #increment the counter.
  bne   $t1, $t2, UniqueElementCheckLoop
UniqueElementCheck_AddElem:
  addiu $t2, $t2, 1     #
  sw    $t2, UniqueElementsArray#increments the counter in the array.
  sw    $a0, 4($t0)     #Stores the new element in the array.  
UniqueElementCheck_ElemExists:
  jr    $ra             #


#Procedure: MemAllocCoefficientMatrix
#
#Allocate memory for the matrix to solve. They are ID'd by the order of unique
#elements in the UniqueElementsArray.
#
#Input: $a0 number of reactants and products combined.
#
#Output: $v0 address of dynamicallY allocated matrix.

MemAllocCoefficientMatrix:
  lw    $t0, UniqueElementsArray#
  mul   $a0, $a0, $t0   #Get the total size of the matrix necessary. Matrix
  li    $v0, 9          #will be in bytes. syscall code to allocate memory.
  syscall               #
  jr    $ra


#Procedure: PopulateArray
#
#Fills the appropriate size array with the required coefficients. ID'd in
#order of unique elements in UniqueElementsArray. Size of string array (number
#of reactants and products total) is passed, and number of unique elements is
#obtained from the array.
#
#Input: $a0 address of coefficient matrix.
#
#Input: $a1 address of string matrix.
#
#Input: $a2 Size of string array (number of reactants and products total)

PopulateArray:
  addiu $sp, $sp, -20   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  sw    $s3, 16($sp)    #

  lw    $s0, UniqueElementsArray# t0 holds number of unique elements.
                        #this will be the time to stop looping.
  move  $s1, $a1        #
  move  $s2, $a2        #
  move  $s3, $zero      #this will be our counter.
  
PopulateArrayLoop:
  addiu $s3, $s3, 1     #
  la    $t0, UniqueElementsArray#reload the address.
  sll   $t1, $s3, 2     #multiply the counter by 4 for word size.
  add   $t0, $t0, $t1   #offset and increment, b/c first term is index size.
  move  $a1, $s1        #a0 is not reloaded b/c the previous run leaves it
  move  $a2, $s2        #where it should be per the function info.
  lw    $a3, 0($t0)     #load the unique element ID for this row.
  jal   PopulateRow     #
  bne   $s3, $s0, PopulateArrayLoop#
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  lw    $s3, 16($sp)    #
  addiu $sp, $sp, 20    #
  jr    $ra             #
  jr    $ra             #


#Procedure: PopulateRow
#
#Fills the appropriate row of the coefficient array with the required 
#coefficients. ID'd in order of unique elements in UniqueElementsArray. 
#Size of string array (number of reactants and products total) is passed,
#and number of unique elements is obtained from the array.
#
#Input: $a0 address of row to fill in coefficient matrix.
#
#Input: $a1 address of string matrix.
#
#Input: $a2 Size of string array (number of reactants and products total)
#
#Input: $a3 ID of element for this specific row. 
#
#Output: $a0 will be at the first entry of the next row.

PopulateRow:
  addiu $sp, $sp, -16   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  move  $s1, $zero      #
  move  $s2, $a2        #
  addiu $s0, $a1, 16    #offset to get to the processed rows, and keep in s0.
PopulateRowLoop:
  move  $a1, $s0        #
  jal   GetCoefficient  #
  sb    $v0, 0($a0)     #
  addiu $s0, $s0, 32    #jump to next processed string row.
  addiu $a0, $a0, 4     #jump to next address block of matrix.
  addiu $s1, $s1, 1     #increment the counter.
  bne   $s1, $s2, PopulateRowLoop#
  
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  addiu $sp, $sp, 16    #
  jr    $ra             #


#Procedure: GetCoefficient
#
#Runs through the processed row of the string array to determine a total
#coefficient for a specific element ID.
#
#Input: $a1 address of a processed row in the string array.
#
#Input: $a3 element ID to check for.
#
#Output: $v0 coefficient for the specific element.

GetCoefficient:
  move  $v0, $zero      #reset the incrementer. Necessary as some elements
                        #appear multiple times in a formula.
GetCoefficientLoop:
  lb    $t1, 0($a1)     #
  beqz   $t1, GetCoefficientDone#If the value equals zero, we have processed
  bne   $t1, $a3, GetCoefficientIncr#through all values. Go to end function.
  lb    $t2, 1($a1)     #If it's a match, load up the coefficient and add
  add   $v0, $v0, $t2   #to the running tally.
GetCoefficientIncr:
  addiu $a1, $a1, 2     #skip two bytes and check the next combo of ID's and
                        #values.
  j     GetCoefficientLoop#
GetCoefficientDone:     
  jr    $ra             #


#Procedure: NegateProducts
#
#When considering a system of equations balancing a chemical reaction, the sum
#of the reactants must equal the sum of the products. Convert this to matrix
#form and the products must be negative. They are currently all positive, so
#this function multiplies every product by negative 1.
#
#Input: $a0 address of the coefficient matrix.
#
#Input: $a1 number of rows.
#
#Input: $a2 number of reactants alone.
#
#Input: $a3 number of products alone.

NegateProducts:
  addiu $sp, $sp, -8    #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  move  $s0, $zero      #
NegateProductsLoop:
  jal   NegateProductsRow#
  addiu $s0, $s0, 1     #
  bne   $s0, $a1, NegateProductsLoop
  
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  addiu $sp, $sp, 8     #
  jr    $ra


#Procedure: NegateProductsRow
#
#Negates all the products in a row.
#
#Input: $a0 address of a particular row in the coefficient matrix.
#
#Input: $a2 number of reactants alone.
#
#Input: $a3 number of products alone.
#
#Output: All arguments remain unchanged except $a0, which is now at the start
#        of the next row. $a1 is not used nor accessed.

NegateProductsRow:
  move  $t0, $zero      #this will be our incrementer.
  sll   $t1, $a2, 2     #mul by 4 for word size.
  add   $a0, $a0, $t1   #start at the products.
NegateProductsRowLoop:
  lw    $t3, 0($a0)     #load the product.
  not   $t3, $t3        #Not and plus one shifts is eqv. to multiplying by -1
  addiu $t3, $t3, 1     #in two's complement.
  sw    $t3, 0($a0)     #Store the product.
  addiu $a0, $a0, 4     #Up the address space.
  addiu $t0, $t0, 1     #increment the counter.
  bne   $t0, $a3, NegateProductsRowLoop#
  
  jr    $ra             #


#Procedure: SimplifyArray
#
#Reduce the array to row-echelon form.
#
#Input: $a0 address of the coefficient matrix.
#
#Input: $a1 number of unique elements (aka rows).
#
#Input: $a2 number of total reactants and products (aka columns).

SimplifyArray:
  addiu $sp, $sp, -20   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  sw    $s3, 16($sp)    #
  move  $s0, $a0        #addr of matrix.
  move  $s1, $a1        #No. of rows.
  move  $s2, $a2        #No. of columns.
  move  $s3, $zero      #incrementer.
    
SimplifyArrayLoop:
  move  $a0, $s0        #NAddr of matrix.
  move  $a1, $s1        #No. of rows.
  move  $a2, $s2        #No. of columns.
  move  $a3, $s3        #incrementer, which is also the column to simplify.
  jal   SimplifyColumn  #Simplify a column.
  
  move  $a0, $s0        #NAddr of matrix.
  move  $a1, $s1        #No. of rows.
  move  $a2, $s2        #No. of columns.
  jal   GCDMatrix       #Reduce every row by its GCD. Necessary after each
                        #round of multiplying to prevent overflow.
  
  addiu $s3, $s3, 1     #increment the counter.
  addiu $t4, $s1, -1    #b/c we don't balance the final row, stop one short
  bne   $s3, $s1, SimplifyArrayLoop#

  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  lw    $s3, 16($sp)    #
  addiu $sp, $sp, 20    #
  jr    $ra             #


#Procedure: SimplifyColumn
#
#Reduces every cell in a specific column to zero.
#
#Input: $a0 address of the coefficient matrix.
#
#Input: $a1 number of unique elements (aka rows).
#
#Input: $a2 number of total reactants and products (aka columns).
#
#Input: $a3 column to reduce.

SimplifyColumn:
  addiu $sp, $sp, -28   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  sw    $s3, 16($sp)    #
  sw    $s4, 20($sp)    #
  sw    $s5, 24($sp)    #This is needed to hold data between Add and MullRow.
  
  move  $s0, $a0        #addr of matrix.
  move  $s1, $a1        #No. of rows.
  move  $s2, $a2        #No. of columns.
  move  $s3, $a3        #column to reduce.
  move  $s4, $zero      #incrementer, a.k.a. current row to work on.
  
SimplifyColumnLoop:
  beq   $s4, $s3, SimplifyColumnCont#Don't perform op on own row.
  sll   $t1, $s3, 2     #mull column to reduce by 4
  add   $t0, $s0, $t1   #add to the addr matrix.
  mul   $t3, $s2, $s4   #multiply no. of columns by row to work on.
  sll   $t3, $t3, 2     #mul by 4 for word size.
  add   $t0, $t0, $t3   #t3 now holds addr of coefficient of row we're going
                        #to delete.
  lw    $s5, 0($t0)     #save the value we're going to add.
  
  #Now that we have the coefficient that we're going to multiply our base row
  #by when we add, we now need to pull the base row coefficient and multiply
  #The affected row by it.
  
  addiu $t0, $s2, 1     #add 1 to no of col's to account for diagonal.
  mul   $t0, $t0, $s3   #multiply this extra offset by column to reduce.
  sll   $t0, $t0, 2     #mul by four for word size.
  add   $t0, $t0, $s0   #add to addr of matrix.
  lw    $a3, 0($t0)     #load coefficient of the base row.
  move  $a0, $s0        #load arguments for MullRow call.
  move  $a1, $s4        #current row to work on.
  jal   MullRow         #
  move  $a0, $s0        #
  move  $a1, $s3        #row to be added (column we're reducing).
  move  $a2, $s4        #row getting added to.
  mul   $a3, $s5, -1    #add the coefficient times negative one.
  jal   AddRow          #

SimplifyColumnCont:
  addiu $s4, $s4, 1     #increment.
  bne   $s4, $s1, SimplifyColumnLoop


  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  lw    $s3, 16($sp)    #
  lw    $s4, 20($sp)    #
  lw    $s5, 24($sp)    #
  addiu $sp, $sp, 28    #
  jr    $ra             #


#Procedure: AddRow
#
#Add a specific row to a specific other row, a specific amount of times. The
#length of the rows is obtained from the argSize variable, and the no. of rows
#isn't needed, as we're assuming we will not try to access a non-existing row.
#
#Adds Ax to B.
#
#Input: $a0 address of coefficient matrix.
#
#Input: $a1 'A' row to be added (0 through x-1, inclusive).
#
#Input: $a2 'B' row getting added to (0 through x-1, inclusive).
#
#Input: $a3 'x' multiple of $a0 row to be added to the $a1 row.

AddRow:
  lw    $t0, argSize    #Limit, aka no. of times to run the loop.
  move  $t1, $zero      # incrementer.
  sll   $t2, $a1, 2     #
  mul   $t2, $t2, $t0   #now an offset for starting point for 'A' row.
  add   $t2, $t2, $a0   #Now the starting point for 'A' row.
  sll   $t3, $a2, 2     #
  mul   $t3, $t3, $t0   #now an offset for starting point for 'B' row.
  add   $t3, $t3, $a0   #Now the starting point for 'B' row.
AddRowLoop:
  lw    $t4, 0($t2)     #load the original A value.
  mul   $t4, $t4, $a3   #apply the factor.
  lw    $t5, 0($t3)     #load the original B value.
  add   $t5, $t5, $t4   #Add the multiplicand.
  sw    $t5, 0($t3)     #Store the updated value.
  addiu $t2, $t2, 4     #
  addiu $t3, $t3, 4     #Increment both addresss's.
  addiu $t1, $t1, 1     #increment the counter.
  bne   $t0, $t1, AddRowLoop#
  jr    $ra             #


#Procedure: MullRow
#
#Multiply a specific row by a specific value. Extremely similar to AddRow, but
#used often enough to warrant its own function.
#
#Input: $a0 address of coefficient matrix.
#
#Input: $a1 row to be multiplied.
#
#Input: $a3 factor to be applied to the aforementioned row.

MullRow:
  addiu $sp, $sp, -4    #
  sw    $ra, 0($sp)     #
  move  $a2, $a1        #
  addiu $a3, $a3, -1    #To account for the instance of the row currently
  jal   AddRow          # existing.
  
  lw    $ra, 0($sp)     #
  addiu $sp, $sp, 4     #
  jr    $ra             #


#Procedure: DivRow
#
#Divide a specific row by a specific value. remainders will be lost, so
#GCDRowByFactor must be run on this row with your divider to prevent a loss
#of data.
#
#input: $a0 address of a row in the coefficient matrix.
#
#Input: $a2 number of total reactants and products (aka columns).
#
#Input: $a3 factor to divide by.

DivRow:
  move  $t0, $zero      #this will be the incrementer.
DivRowLoop:
  lw    $t1, 0($a0)     #
  div   $t1, $t1, $a3   #
  sw    $t1, 0($a0)     #
  addiu $a0, $a0, 4     #
  addiu $t0, $t0, 1     #
  bne   $t0, $a2, DivRowLoop#

  jr    $ra             #


#Procedure: GCDMatrix
#
#Reduces every row in the matrix by it's GCD. This is necessary as lots of
#multiplying occurs, and overflow is a significant concern. Run this after
#every SimplifyColumn call.
#
#Input: $a0 address of the coefficient matrix.
#
#Input: $a1 number of unique elements (aka rows).
#
#Input: $a2 number of total reactants and products (aka columns).

GCDMatrix:
  addiu $sp, $sp, -20   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  sw    $s3, 16($sp)    #
  move  $s0, $a0        #addr of matrix.
  move  $s1, $a1        #No. of rows.
  move  $s2, $a2        #No. of columns.
  move  $s3, $zero      #incrementer.
    
GCDMatrixLoop:
  move  $a0, $s0        #NAddr of matrix.
  move  $a2, $s2        #No. of columns.
  jal   GCDRow          #Call the function.
  sll   $t0, $s2, 2     #mult columns by 4.
  add   $s0, $s0 $t0    #offset the addr to the next row.
  addiu $s3, $s3, 1     #increment the counter.
  bne   $s3, $s1, GCDMatrixLoop#

  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  lw    $s3, 16($sp)    #
  addiu $sp, $sp, 20    #
  jr    $ra             #


#Procedure: GCDRow
#
#Reduces a specific row by its GCD.
#
#input: $a0 address of a row in the coefficient matrix.
#
#Input: $a2 number of total reactants and products (aka columns).

GCDRow:
  addiu $sp, $sp, -16   #
  sw    $ra, 0($sp)     #
  sw    $s0, 4($sp)     #
  sw    $s1, 8($sp)     #
  sw    $s2, 12($sp)    #
  move  $s0, $a0        #addr of row.
  move  $s1, $a2        #total no of times to cycle.
  move  $s2, $zero      #incrementer.
  
GCDRowLoop:
  move  $a0, $s0        #address of row
  move  $a2, $s1        # size of row
  la    $t0, Primes     #
  sll   $t1, $s2, 2     #mult incr by 4 for word size.
  add   $t0, $t0, $t1   #Add current offset.
  lw    $a3, 0($t0)     #load up the applicable prime.
  jal   GCDRowByFactor
  beqz  $v0, GCDRowCont #If it failed, skip. Else run this portion.
  move  $a0, $s0        #address of row
  move  $a2, $s1        # size of row
  jal   DivRow          #
  j     GCDRowLoop      #

GCDRowCont:
  addiu $s2, $s2, 1     #
  bne   $s2, 5, GCDRowLoop#
  
  lw    $ra, 0($sp)     #
  lw    $s0, 4($sp)     #
  lw    $s1, 8($sp)     #
  lw    $s2, 12($sp)    #
  addiu $sp, $sp, 16    #
  jr    $ra             #


#Procedure: GCDRowByFactor
#
#Check a specific row by a specific factor. Return 0 if it fails, return 1 if
#it passes. The return aspect is necessary so we can apply the same factor
#multiple times.
#
#input: $a0 address of a row in the coefficient matrix.
#
#Input: $a2 number of total reactants and products (aka columns).
#
#Input: $a3 prime factor to check.
#
#Output: $v0 0 if unsuccessful, 1 if successfully reduced the row by the
#              factor.

GCDRowByFactor:
  move  $v0, $zero      #this will be the flag.
  move  $t0, $zero      #this will be the counter.
GCDRowByFactorLoop:  
  lw    $t1, 0($a0)     #
  bgez  $t1, GCDRowByFactorPositive
  mul   $t1, $t1, -1    #
GCDRowByFactorPositive:
  div   $t1, $a3        #Actually perform the division.
  mfhi  $t2             #
  bnez  $t2, GCDRowByFactorFinish#
  addiu $t0, $t0, 1     # increment the counter.
  addiu $a0, $a0, 4     #increment the addresser.
  bne   $t0, $a2, GCDRowByFactorLoop#If loop isn't finished, skip to next run.
  li    $v0, 1          #
GCDRowByFactorFinish:
  jr    $ra             #


#Procedure: StoreCoefficients
#
#Takes a reduced echelon form matrix and stores the coefficients. Each of the
#last terms of the first x-1 columns are the first x-1 coefficients. As we
#treated the last product as the integer constant and avoided fractions, 
#counter-intuitively the very first term of the array is the coefficient for
#the last product.
#
#Input: $a0 address of reduced echelon matrix.

StoreCoefficients:
  move  $t2, $a0        #
  move  $t7, $t2        #
  li    $v0, 9          #
  lw    $a0, argSize    #
  syscall
  sw    $v0, CoefficientAddr#
  move  $t4, $v0        #t4 holds address of coefficient list.
  lw    $t0, argSize    #how far to go, and how many coefficients.
  move  $t1, $zero      #incrementer
  addiu $t5, $t0, -1    #minus one to get last member of row. also for ending.
  sll   $t3, $t5, 2     #mul by 4 for word size.
  sll   $t0, $t0, 2     #t0 is now byte offset for each cycle.
  add   $t2, $t2, $t3   #give us a starting position.
StoreCoefficientsLoop:
  lw    $t6, 0($t2)     #load the coefficient.
  bgtz  $t6, StoreCoefficientPos#
  mul   $t6, $t6, -1    #swap the sign.
StoreCoefficientPos:
  sb    $t6, 0($t4)     #
  addiu $t4, $t4, 1     #Store coefficient.
  addiu $t1, $t1, 1     #incrementer
  add   $t2, $t2, $t0   #add byte-size incrementer to array address.
  bne   $t1, $t5, StoreCoefficientsLoop#
  #Once the first x-1 are stored, pull first item in array and store as the
  #last coefficient.
  lw    $t6, 0($t7)     #
  bgtz  $t6, StoreLastCoefficientPos#
  mul   $t6, $t6, -1    #swap the sign.
StoreLastCoefficientPos:
  sb    $t6, 0($t4)     #
  
  jr    $ra             #


#Procedure: ClearNewlines
#
#Scrubs a 32 byte width array of all newline characters and replaces with null.
#
#Input: $a0 address of string input matrix.
#
#Input: $a1 number of rows.

ClearNewlines:
  sll   $a1, $a1, 5     #multiply num of rows by to get an address end space.
  move  $t0, $zero      #incrementer.
ClearNewlinesLoop:
  lb    $t2, 0($a0)     #load character
  bne   $t2, 10, ClearNewlinesCont
  sb    $zero, 0($a0)   #replace with null character.
ClearNewlinesCont:
  addiu $t0, $t0, 1     #increment.
  addiu $a0, $a0, 1     #
  bne   $a1, $t0, ClearNewlinesLoop

  jr    $ra             #


#Procedure: PrintBalancedEqn
#
#Prints out the balanced equation.
#
#Input: $a0 address of string input matrix.
#
#Input: $a1 number of reactants.
#
#Input: $a2 number of products.

PrintBalancedEqn:
  move  $t0, $a0        #store the original address.
  move  $t1, $zero      #incrementer
  lw    $t2, CoefficientAddr#
  li    $t7, 1          #flag to not print + on first go round
PrintReactantsLoop:
  beq   $t7, 1, PrintReactantsSkipPlus
  la    $a0, Plus      #
  li    $v0, 4
  syscall               #
PrintReactantsSkipPlus:
  move  $t7, $zero      #reset flag.
  lb    $a0, 0($t2)     #Load coefficient to print
  li    $v0, 1          #
  syscall
  
  move  $a0, $t0        #
  li    $v0, 4          #
  syscall               #
  
  addiu $t0, $t0, 32    #sent the string array to the next line.
  addiu $t2, $t2, 1     #increment coefficient address by 1.
  addiu $t1, $t1, 1     #increment counter by 1.
  bne   $t1, $a1, PrintReactantsLoop#


  move  $t1, $zero      #incrementer
  la    $a0, Arrow      #
  li    $v0, 4
  syscall               #

  li    $t7, 1          #flag to not print + on first go round
PrintProductsLoop:
  beq   $t7, 1, PrintProductsSkipPlus
  la    $a0, Plus      #
  li    $v0, 4
  syscall               #
PrintProductsSkipPlus:
  move  $t7, $zero      #reset flag.
  lb    $a0, 0($t2)     #Load coefficient to print
  li    $v0, 1          #
  syscall
  
  move  $a0, $t0        #
  li    $v0, 4          #
  syscall               #
  
  addiu $t0, $t0, 32    #sent the string array to the next line.
  addiu $t2, $t2, 1     #increment coefficient address by 1.
  addiu $t1, $t1, 1     #increment counter by 1.
  bne   $t1, $a2, PrintProductsLoop#

  jr    $ra             #


#Procedure: Error
#
#Lets the user know something went wrong. More to come later (error codes?
#Extra printouts? Who's to tell).
#
#This function has no inputs or outputs (yet).

Error:
  la    $a0, ErrorPrompt
  li    $v0, 4
  syscall
  j     exit













