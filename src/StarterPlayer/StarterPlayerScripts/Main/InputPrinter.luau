return {
    onInputBegan = function(inputObject, processedEvent)
        if processedEvent then return end
        if inputObject.UserInputType == Enum.UserInputType.Keyboard then
            print("A key was released: " .. inputObject.KeyCode.Name)
        end
    end
}