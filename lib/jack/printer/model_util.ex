defmodule Jack.Printer.ModelUtil do

  alias Jack.Printer.Pits
  alias Jack.Printer.Sandoval

  def list_to_model({rows, file_hash}, :pits) do
    [omni_id, ca, secretary, administrative_unit, street_and_number, suburb,
    postal_code, municipality, model, serie, repeated_series, delivered, delivered_date,
    is_installed, installed_date, reader, readen_taken, reading_date, copies, prints,
    digitizations, color_copies, color_prints, uploaded_in_folder,
    observations] = rows

     %Pits{
       omni_id: omni_id,
       ca: ca,
       secretary: secretary,
       administrative_unit: administrative_unit,
       street_and_number: street_and_number,
       suburb: suburb,
       postal_code: postal_code,
       municipality: municipality,
       model: model,
       serie: serie,
       repeated_series: repeated_series,
       delivered: delivered,
       delivered_date: delivered_date,
       is_installed: is_installed,
       installed_date: installed_date,
       reader: reader,
       readen_taken: readen_taken,
       reading_date: reading_date,
       copies: copies,
       prints: prints,
       digitizations: digitizations,
       color_copies: color_copies,
       color_prints: color_prints,
       uploaded_in_folder: uploaded_in_folder,
       observations: observations,
       file_hash: file_hash
     }
  end

  def list_to_model({rows, file_hash}, :sandoval) do
    [cvo, nvo_id, organism, secretary, administrative_unit, street_and_number,
     suburb, postal_code, municipality, model, double_letter,
     table, extra_equipment, connection_cable, regulator, hi_print_notes,
     contact_or_responsabe, phone, email, clasification, status,
     who_receives, ip_connection, serie, is_delivered, delivered_date,
     is_installed, instalation_date, observations, comentaries] = rows
    %Sandoval{
      cvo: cvo,
      nvo_id: nvo_id,
      organism: organism,
      secretary: secretary,
      administrative_unit: administrative_unit,
      street_and_number: street_and_number,
      suburb: suburb,
      postal_code: postal_code,
      municipality: municipality,
      model: model,
      double_letter: double_letter,
      table: table,
      extra_equipment: extra_equipment,
      connection_cable: connection_cable,
      regulator: regulator,
      hi_print_notes: hi_print_notes,
      contact_or_responsabe: contact_or_responsabe,
      phone: phone,
      email: email,
      clasification: clasification,
      status: status,
      who_receives: who_receives,
      ip_connection: ip_connection,
      serie: serie,
      is_delivered: is_delivered,
      delivered_date: delivered_date,
      is_installed: is_installed,
      instalation_date: instalation_date,
      observations: observations,
      comentaries: comentaries,
      file_hash: file_hash
    }
  end

end
