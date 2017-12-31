long exchange(long *xp, long y)
{
	long x = *xp;
	*xp = y;
	return x;
}
void main()
{
	long s = 5;
	exchange(&s, 50l);

}