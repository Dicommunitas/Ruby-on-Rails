module ApplicationHelper
  def formatarDataHora(data_hora)
    if data_hora.class == String
      begin
        data_hora = DateTime.strptime(data_hora, '%d/%m/%Y %H:%M')
      rescue
        data_hora = nil
      end
    end

    if (data_hora == nil)
      '_/_/_ _:_'
    else
      data_hora.strftime("%d/%m/%Y %H:%M")
    end
  end

  def formatarData(data)
    if data.class == String
      begin
        data = Date.strptime(data, '%d/%m/%Y')
      rescue
        data = nil
      end
    end

    if (data == nil)
      '_/_/_'
    else
      data.strftime("%d/%m/%Y")
    end
  end

  def formatarSeg(segundos)
    h = (segundos/(60*60)).to_i
    m = (segundos%(60*60)).div 60
    "%02d:%02d" % [ h, m ]
  end

  def grupoTanquesNavio
    tanques = [
      "01BB/P",
      "02BB/P",
      "03BB/P",
      "04BB/P",
      "05BB/P",
      "06BB/P",
      "07BB/P",
      "08BB/P",
      "09BB/P",
      "10BB/P",
      "11BB/P",
      "12BB/P",
      "13BB/P",
      "14BB/P",
      "15BB/P",
      "Slop BB/P",
      "01CE BB/P",
      "02CE BB/P",
      "03CE BB/P",
      "04CE BB/P",
      "05CE BB/P",
      "06CE BB/P",
      "07CE BB/P",
      "08CE BB/P",
      "09CE BB/P",
      "10CE BB/P",
      "11CE BB/P",
      "12CE BB/P",
      "13CE BB/P",
      "14CE BB/P",
      "15CE BB/P",
      "01CE",
      "02CE",
      "03CE",
      "04CE",
      "05CE",
      "06CE",
      "07CE",
      "08CE",
      "09CE",
      "10CE",
      "11CE",
      "12CE",
      "13CE",
      "14CE",
      "15CE",
      "Slop CE",
      "01CE BE/P",
      "02CE BE/P",
      "03CE BE/P",
      "04CE BE/P",
      "05CE BE/P",
      "06CE BE/P",
      "07CE BE/P",
      "08CE BE/P",
      "09CE BE/P",
      "10CE BE/P",
      "11CE BE/P",
      "12CE BE/P",
      "13CE BE/P",
      "14CE BE/P",
      "15CE BE/P",
      "01BE/S",
      "02BE/S",
      "03BE/S",
      "04BE/S",
      "05BE/S",
      "06BE/S",
      "07BE/S",
      "08BE/S",
      "09BE/S",
      "10BE/S",
      "11BE/S",
      "12BE/S",
      "13BE/S",
      "14BE/S",
      "15BE/S",
      "Slop BE/S",
      ]
  end

end

