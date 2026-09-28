if (not instance_exists(@SkinSelector))
#if GMS2
    @create(@SkinSelector);
#else
    instance_create(0,0,@SkinSelector);
#endif
