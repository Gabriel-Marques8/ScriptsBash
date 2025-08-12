// Classe que representa um algoritmo
public class Algo
{
    public string nome { get; set; }
    public double valor { get; set; }
    public DateTime data { get; set; }
}

// Classe que gerencia os algoritmos
public class AlgoManager
{
    private List<Algo> Algos;

    public AlgoManager()
    {
        Algos = new List<Algo>
        {
            new Algo { nome = "Exemplo 1", valor = 10.0, data = DateTime.Now },
            new Algo { nome = "Exemplo 2", valor = 20.0, data = DateTime.Now },
            new Algo { nome = "Exemplo 3", valor = 30.0, data = DateTime.Now },
        };
    }

    // Método para buscar um algoritmo pelo nome
    public Algo buscarAlgoPorNome(string filtroNome)
    {
        return Algos.FirstOrDefault(n => n.nome.Contains(filtroNome));
    }

    // Método para listar todos os algoritmos
    public List<Algo> listarTodosAlgoritmos()
    {
        return Algos;
    }

    // Método para adicionar um novo algoritmo
    public void adicionarAlgo(Algo novoAlgo)
    {
        Algos.Add(novoAlgo);
    }
}