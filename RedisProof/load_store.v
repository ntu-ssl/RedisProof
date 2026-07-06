Definition load_RData (sz: Z) (p : Ptr) (st: RData) : option (Z * RData) :=
    if p.(pbase) =s "memory" then (
        when ret == st.(memory).(data) @ p.(poffset);
        Some (ret, st))
    else if p.(pbase) =s "dict_can_resize" then
        Some (st.(dict_can_resize), st)
    else
        Some (0, bad_st).

Definition store_RData (sz: Z) (p : Ptr) (v: Z) (st: RData) : option RData :=
    if p.(pbase) =s "memory" then
        let n_data := (st.(memory).(data) # p.(poffset) == Some v) in
        Some (st.[memory].[data] :< n_data)
    else if p.(pbase) =s "dict_can_resize" then
        Some (st.[dict_can_resize] :< v)
    else
        Some bad_st.