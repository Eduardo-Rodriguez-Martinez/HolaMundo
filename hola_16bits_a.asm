;Hola mundo en ensamblador

DATAS SEGMENT
        MENSAJE DB 'Hola Mundo!!',13,10,'$'
DATAS ENDS

CODES SEGMENT
        ASSUME CS:CODES, DS:DATAS
START:
        MOV AX, DATAS
        MOV DS, AX

        LEA DX, MENSAJE

        MOV AH, 9
        INT 21H

        MOV AH, 4CH
        INT 21H
CODES ENDS
END START
