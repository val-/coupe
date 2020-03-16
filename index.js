
const fs = require('fs');
const exec = require('child_process').exec;
const json2xls = require('json2xls');

const sheetIndex = {};
const sheetList = [];


exec('openscad swing-model.scad -o test.png', {}, (error, stdout, stderr) => {
    processData(stderr);
});

function processData(data) {
    data.split('\n').forEach((rec) => {
        if (rec.indexOf('ECHO: ') !== -1) {
            let recId = cleanRec(rec);
            if (!sheetIndex[recId]) {
                sheetIndex[recId] = 1;
            } else {
                sheetIndex[recId]++;
            }
        }
    });

    
    for (var recId in sheetIndex) {
        if (sheetIndex.hasOwnProperty(recId)) {
            let [ length, width, thickness,edging_string_width, edging_string_length ] = recId.split('_');                
            sheetList.push([
                '',
                length,
                width,
                sheetIndex[recId],
                thickness,
                '', '', '',
                edging_string_width,
                edging_string_length

            ])
        } 
    }

    const sheetListSorted = sheetList.sort((a, b) => {
        if (a[4] < b[4]) {
            return 1;
        } else if (a[4] > b[4]) {
            return -1;
        } else {
            return 0;
        }

    })

    console.log('sheetListSorted: ', sheetListSorted);

    let xls = json2xls(sheetList);
    fs.writeFileSync('sheetList.xlsx', xls, 'binary');

}


function cleanRec(rec) {
    return rec.replace('ECHO: "', '').replace('"', '');
}