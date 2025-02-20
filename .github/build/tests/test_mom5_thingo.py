import pytest # type: ignore

class TestThingo:
    @pytest.mark.some_group_of_tests
    def test_aspect1_of_thingo(self):
        pass
    
    @pytest.mark.some_group_of_tests
    def test_aspect2_of_thingo(self):
        pass