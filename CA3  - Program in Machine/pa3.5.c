int change(long *xp, long y)
{
    long x = *xp;
    *xp = y;
    return x;
}
void main()
{
    long s;
    s = 52;
    change(&s, 52l);
}