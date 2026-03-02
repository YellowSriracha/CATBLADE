// An example method to use this

//function scrTestPacking()
//{
//	global.saveData = {
//    roomID: 12,
//    gameTime: 42400,
//    unlocks: {
//        climb: true,
//        fastClimb: false,
//        jump: true,
//        slash: false,
//        doubleSlash: true
//    },
//    collectibles: {
//        blue: false,
//        red: true,
//        green: true,
//        yellow: false,
//        magentia: true
//    },
//    mapEvents: [true, false, true, false, true, false, true, false]
//};

//var password = scrPackSaveDataToHexadecimalPassword(global.saveData);
//var saveData = scrUnpackSaveDataFromHexadecimalPassword(password);
//return saveData;
//}

/// @function scrPackSaveDataToHexadecimalPassword(_saveData)
/// @desc Packs a save data struct into a hexadecimal password string.
function scrPackSaveDataToHexadecimalPassword(_saveData)
{
	var packagedInt = pack_room_data_to_int(global.saveData);
	var hexKey = int_to_hex_key(packagedInt);
	return hexKey;
}

/// @function scrUnpackSaveDataFromHexadecimalPassword(_hexPassword)
/// @desc Unpacks a hexadecimal password string back into a save data struct.
function scrUnpackSaveDataFromHexadecimalPassword(_saveData)
{
	var unpackagedInt = hex_string_to_int(_saveData);
	var unpackagedSaveData = unpack_room_data_from_int(unpackagedInt);
	return unpackagedSaveData;
}


/// @function scrPackRoomDataToInt(_saveData)
/// @desc Packs save data into a single integer.
///
/// Bit layout:
/// 0-7   : roomID        (8 bits)
/// 8-23  : gameTime      (16 bits)
/// 24    : climb
/// 25    : fastClimb
/// 26    : jump
/// 27    : slash
/// 28    : doubleSlash
/// 29    : blue
/// 30    : red
/// 31    : green
/// 32    : yellow
/// 33    : magentia
/// 34-41 : mapEvent1-8
///
/// Note:
/// This uses 42 bits total, which is safe in GameMaker because numbers
/// are stored as reals and integers are exact up to 53 bits.
function int_to_hex_key(_packed_int)
{
    var digits = "0123456789ABCDEF";
    
    if (_packed_int == 0)
    {
        return "0x0";
    }
    
    var result = "";
    var value = _packed_int;
    
    while (value > 0)
    {
        var nibble = value & 15; // 15 = 0xF
        result = string_char_at(digits, nibble + 1) + result;
        value = value >> 4;
    }
    
    return "0x" + result;
}

function hex_string_to_int(_hexString)
{
    if (string_copy(_hexString, 1, 2) != "0x")
    {
        _hexString = "0x" + _hexString;
    }
    
    return real(_hexString);
}

function pack_room_data_to_int(_saveData)
{
    var shiftDict = {
        roomIdShift:     0,  // 8 bits
        gameTimeShift:   8,  // 16 bits

        climb:          24,  // 1 bit
        fastClimb:      25,  // 1 bit
        jump:           26,  // 1 bit
        slash:          27,  // 1 bit
        doubleSlash:    28,  // 1 bit
        blue:           29,  // 1 bit
        red:            30,  // 1 bit
        green:          31,  // 1 bit
        yellow:         32,  // 1 bit
        magentia:       33,  // 1 bit

        mapEvent1:      34,  // 1 bit
        mapEvent2:      35,  // 1 bit
        mapEvent3:      36,  // 1 bit
        mapEvent4:      37,  // 1 bit
        mapEvent5:      38,  // 1 bit
        mapEvent6:      39,  // 1 bit
        mapEvent7:      40,  // 1 bit
        mapEvent8:      41   // 1 bit
    };

    var packedInt = 0;

    // TODO: Pack fixed-width values
    packedInt = pack_8bit_into_int(packedInt, _saveData.roomID, shiftDict.roomIdShift);
    packedInt = pack_16bit_into_int(packedInt, _saveData.gameTime, shiftDict.gameTimeShift);

    // TODO: Pack unlocks
    packedInt = pack_bool_into_int(packedInt, _saveData.unlocks.climb,       shiftDict.climb);
    packedInt = pack_bool_into_int(packedInt, _saveData.unlocks.fastclimb,   shiftDict.fastClimb);
    packedInt = pack_bool_into_int(packedInt, _saveData.unlocks.jump,        shiftDict.jump);
    packedInt = pack_bool_into_int(packedInt, _saveData.unlocks.slash,       shiftDict.slash);
    packedInt = pack_bool_into_int(packedInt, _saveData.unlocks.doubleslash, shiftDict.doubleSlash);

    // TODO: Pack collectibles
    packedInt = pack_bool_into_int(packedInt, _saveData.collectibles.blue,      shiftDict.blue);
    packedInt = pack_bool_into_int(packedInt, _saveData.collectibles.red,       shiftDict.red);
    packedInt = pack_bool_into_int(packedInt, _saveData.collectibles.green,     shiftDict.green);
    packedInt = pack_bool_into_int(packedInt, _saveData.collectibles.yellow,    shiftDict.yellow);
    packedInt = pack_bool_into_int(packedInt, _saveData.collectibles.magenta,  shiftDict.magentia);

    // TODO: Pack map events (assumes array of at least 8 bools)
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[0], shiftDict.mapEvent1);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[1], shiftDict.mapEvent2);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[2], shiftDict.mapEvent3);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[3], shiftDict.mapEvent4);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[4], shiftDict.mapEvent5);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[5], shiftDict.mapEvent6);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[6], shiftDict.mapEvent7);
    packedInt = pack_bool_into_int(packedInt, _saveData.mapEvents[7], shiftDict.mapEvent8);

    return packedInt;
}


/// @function scrUnpackRoomDataFromInt(_packedInt)
/// @desc Unpacks a packed save integer back into a saveData struct.
function unpack_room_data_from_int(_packedInt)
{
    var shiftDict = {
        roomIdShift:     0,
        gameTimeShift:   8,

        climb:          24,
        fastClimb:      25,
        jump:           26,
        slash:          27,
        doubleSlash:    28,
        blue:           29,
        red:            30,
        green:          31,
        yellow:         32,
        magenta:       33,
        mapEvent1:      34,
        mapEvent2:      35,
        mapEvent3:      36,
        mapEvent4:      37,
        mapEvent5:      38,
        mapEvent6:      39,
        mapEvent7:      40,
        mapEvent8:      41
    };

    var saveData = {
        roomID: unpack_8bit_from_int(_packedInt, shiftDict.roomIdShift),
        gameTime: unpack_16bit_from_int(_packedInt, shiftDict.gameTimeShift),

        unlocks: {
            climb:       unpack_bool_from_int(_packedInt, shiftDict.climb),
            fastClimb:   unpack_bool_from_int(_packedInt, shiftDict.fastClimb),
            jump:        unpack_bool_from_int(_packedInt, shiftDict.jump),
            slash:       unpack_bool_from_int(_packedInt, shiftDict.slash),
            doubleSlash: unpack_bool_from_int(_packedInt, shiftDict.doubleSlash)
        },

        collectibles: {
            blue:      unpack_bool_from_int(_packedInt, shiftDict.blue),
            red:       unpack_bool_from_int(_packedInt, shiftDict.red),
            green:     unpack_bool_from_int(_packedInt, shiftDict.green),
            yellow:    unpack_bool_from_int(_packedInt, shiftDict.yellow),
            magentia:  unpack_bool_from_int(_packedInt, shiftDict.magentia)
        },

        mapEvents: [
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent1),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent2),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent3),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent4),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent5),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent6),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent7),
            unpack_bool_from_int(_packedInt, shiftDict.mapEvent8)
        ]
    };

    return saveData;
}


/// @function pack_16bit_into_int(_originalValue, _valueToPack, _shift)
function pack_16bit_into_int(_originalValue, _valueToPack, _shift)
{
    var mask = 65535 << _shift;
    return (_originalValue & ~mask) | ((_valueToPack & 65535) << _shift);
}

/// @function unpack_16bit_from_int(_originalValue, _shift)
function unpack_16bit_from_int(_originalValue, _shift)
{
    return (_originalValue >> _shift) & 65535;
}

/// @function pack_8bit_into_int(_originalValue, _valueToPack, _shift)
function pack_8bit_into_int(_originalValue, _valueToPack, _shift)
{
    var mask = 255 << _shift;
    return (_originalValue & ~mask) | ((_valueToPack & 255) << _shift);
}

/// @function unpack_8bit_from_int(_originalValue, _shift)
function unpack_8bit_from_int(_originalValue, _shift)
{
    return (_originalValue >> _shift) & 255;
}

/// @function pack_bool_into_int(_originalValue, _boolToPack, _shift)
function pack_bool_into_int(_originalValue, _boolToPack, _shift)
{
    var mask = 1 << _shift;
    return (_originalValue & ~mask) | ((_boolToPack ? 1 : 0) << _shift);
}

/// @function unpack_bool_from_int(_originalValue, _shift)
function unpack_bool_from_int(_originalValue, _shift)
{
    return ((_originalValue >> _shift) & 1) == 1;
}