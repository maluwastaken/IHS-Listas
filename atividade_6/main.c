#include <stdio.h>

extern void sort(int*,int);

int main(){
    int vetor[10];
    int n=0;
    printf("Quanto numeros voce gostaria de inserir? ");
    scanf("%d",&n);

    int  i=0;
    while(i<n){
        printf("Digite o valor [%d]: ",i+1);
        scanf("%d",&vetor[i]);
        i++;
    }

    i=0;

    sort(vetor,n-1);


    printf("Vetor ordenado:");
    while(i<n){
        printf("%d ",vetor[i]);
        i++;
    }
    printf("\n");

    return 0;
}