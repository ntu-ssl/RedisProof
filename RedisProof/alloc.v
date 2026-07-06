Include "datatypes.v".

Definition alloc (sz : Z) (align : Z) (st : RData) : option (Ptr * RData) :=
    let n_offset := st.(stack).(soffset) + sz in
    let n_mapping := st.(stack).(smapping) # st.(stack).(soffset) == Some 0 in
    Some (
        (mkPtr "stack" st.(stack).(soffset)), 
        st.[stack] :< (mkStack n_offset n_mapping)
    ).