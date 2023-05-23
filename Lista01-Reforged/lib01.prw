#INCLUDE "TOTVS.CH"

Static Function NUMBER(nMSG) //Funcionando

    local nI := 0
    
    IF LEN(nMSG) < 1
        RETURN .F.
    ENDIF

        FOR nI := 1 to LEN(nMSG)
            IF !ISDIGIT(SUBSTR(nMSG, nI , 1)) .AND. !SUBSTR(nMSG, nI , 1) == "." .AND. !SUBSTR(nMSG, nI , 1) == "-"
                RETURN .F.
            ENDIF
        NEXT nI
RETURN .T.
