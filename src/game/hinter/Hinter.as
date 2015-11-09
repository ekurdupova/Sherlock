package game.hinter
{
	import game.CeilState;

	public class Hinter
	{
		/**
		 * Hinter выдает подсказку по уже открытым ячейкам и данным условиям (скрытые условия не учитываются).
		 * Если среди открытых ячеек есть неверная, Hinter сообщает об этом и возвращает ее в исходное состояние (показывает все варианты за исключением открытых в других столбцах).
		 * Если верный элемент скрыт из соответствующей ячейки, Hinter сообщает об этом и возвращает ее в исходное состояние (показывает все варианты за исключением открытых в других столбцах).
		 * Если конфигурация игры не противоречива (не выполняются первые 2 условия), Hinter выдает подсказку: подсвечивает условие, из которого делается вывод, выводит соответствующий текст,
		 * разъясняющий производимое действия и после нажатия пользователем левой кнопки мыши обрабатывает подсказку, т.е. удаляет невозможный элемент из ячейки или выбирает единственно возможный.
		 * Если по имеющимся условиям Hinter, не может дать подсказку, он предлагает открыть Other clues и нажать Hint еще раз.
		 */ 
		public function Hinter()
		{
		}
		
		public function getHint(mainBoardState:Array, solution:Array):IHint
		{
			var result:IHint = checkSelectedImages(mainBoardState, solution);
			
			if (result == null)
			{
				result = checkHiddenImages(mainBoardState, solution);
			}
			
			return result;
		}
		
		private function checkSelectedImages(mainBoardState:Array, solution:Array):IHint
		{
			for (var i:int = 0; i < 6; ++i)
				for (var j:int = 0; j < 6; ++j)
				{
					var ceilState:CeilState = mainBoardState[i][j];
					if (ceilState.selectedImgNumber != -1 &&
						ceilState.selectedImgNumber != solution[j][i])
					{
						return new WrongImageSelectedHint(i, j);
					}
				}
			
			return null;
		}
		
		private function checkHiddenImages(mainBoardState:Array, solution:Array):IHint
		{
			for (var i:int = 0; i < 6; ++i)
				for (var j:int = 0; j < 6; ++j)
				{
					var ceilState:CeilState = mainBoardState[i][j];
					if (ceilState.selectedImgNumber == -1 &&
						!ceilState.showedImages[solution[j][i] % 10])
					{
						return new WrongImageHiddenHint(i, j);
					}
				}
			return null;
		}
	}
}
