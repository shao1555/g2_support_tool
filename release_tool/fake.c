#include <stdio.h>
#include <fcntl.h>

#define KEY	0x34

#define BUFFER_SIZE 1024

int main(int argc,char* argv[])
{
	int		read_cnt;
	char	buffer[BUFFER_SIZE];
	FILE*	fp;
	FILE*	fp2;

	int		i;
	int		total=0;
	char	tmp;

	if(argc < 2 )
	{
		return -1;
	}
	fp = fopen(argv[1],"rb");
	if(fp == (FILE*)0)
	{
		return 1;
	}
	printf("file:%s\n",argv[1]);
	

	fp2 = fopen(argv[2],"wb");
	if(fp2 == (FILE*)0)
	{
		return 1;
	}
	for(;;)
	{
		read_cnt = fread(buffer,BUFFER_SIZE,1,fp);

		total	+= read_cnt*BUFFER_SIZE;
		if( read_cnt == 0 )
		{
			printf("processed size:%d\n",total);
			break;
		}
		for(i=0;i<(read_cnt*BUFFER_SIZE);i++)
		{
			tmp	= buffer[i] ^ KEY;
			
			fwrite(&tmp,1,1,fp2);
		}

		
	}

	fclose(fp);
	fclose(fp2);
}
