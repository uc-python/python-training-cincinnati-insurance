def sum_squares_df(df):
    df["silly_col"] = (
        df["seats"]**2 + 
        df["engines"]**2
    )
    return df