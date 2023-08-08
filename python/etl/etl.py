def transform(legacy_data):
    data_map = {}
    for k, _ in legacy_data.items():
        for ch in legacy_data[k]:
            data_map[ch.lower()] = k
                     
    return data_map

