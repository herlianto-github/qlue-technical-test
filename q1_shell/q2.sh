cd /tmp
mkdir -p mig33/inner.folder
touch mig33/inner.folder/1.txt
echo "Green Mango Orange Mango" >> mig33/inner.folder/1.txt
sed -i -e 's/Mango/Apple/g' mig33/inner.folder/1.txt
cat mig33/inner.folder/1.txt