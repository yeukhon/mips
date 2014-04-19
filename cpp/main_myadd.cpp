int myadd(int);

int main()
{
	int a = 42;
	int sum = 31;
	sum = myadd(a);
	cout << sum << endl;
	cout << a << endl;
	return 0;
}

int myadd(int x)
{
	int t = 1;
	x = x + t;
	return x;
}