
echo "Cleaning previous build artifacts..."

# Delete existing build artifacts
if [ -d "Xamarin.iOS.iCarousel.Binding/bin" ]; then
    rm -rf "Xamarin.iOS.iCarousel.Binding/bin"
fi
if [ -d "Xamarin.iOS.iCarousel.Binding/obj" ]; then
    rm -rf "Xamarin.iOS.iCarousel.Binding/obj"
fi

# Execute the builds.
dotnet build Xamarin.iOS.iCarousel.Binding/Xamarin.iOS.iCarousel.Binding.csproj -c Release

# Delete existing output
if [ -d "lib" ]; then
    rm -rf "lib"
fi

mkdir "lib"

# Move libraries into correct folders.
cp -R "Xamarin.iOS.iCarousel.Binding/bin/Release/net8.0-ios" "lib"

# Cleanup unused files that may have been moved by the previous step.
rm "lib/net8.0-ios/Xamarin.iOS.iCarousel.Binding.pdb"