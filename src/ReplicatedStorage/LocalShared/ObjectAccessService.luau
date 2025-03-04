return {
    GetPlayer = function()
        return game.Players.LocalPlayer
    end,
    GetCharacter = function(self)
        local player = self.GetPlayer()
        local character = player.Character or player.CharacterAdded:Wait()
        return character
    end,
    GetHumanoid = function(self)
        return self:GetCharacter():WaitForChild("Humanoid")
    end,
    GetAnimator = function(self)
        return self:GetHumanoid():WaitForChild("Animator")
    end
}