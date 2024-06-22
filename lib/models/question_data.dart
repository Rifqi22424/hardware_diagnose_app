import '../models/question.dart';

final List<Question> questions = [
  Question(
    id: 1,
    text: 'Apakah komputer sering hidup atau mati sendiri?',
    nextQuestionId: 2,
    nextFalseQuestionId: 4,
  ),
  Question(
    id: 2,
    text: 'Apakah waktu komputer dihidupkan, tidak ada reaksi apa-apa?',
    nextQuestionId: 3,
    nextFalseQuestionId: 4,
  ),
  Question(
    id: 3,
    text: 'Apakah komputer hang?',
    repairAdvice: RepairAdvice(
      id: 1,
      damage: 'Power Supply',
      advice: 'Cek kembali kabel pada power nya, atau saklar ON/OFF kemudian pastikan anda mengganti power supply sesuai dengan kebutuhan hardware komputer anda.',
    ),
  ),
  Question(
    id: 4,
    text: 'Apakah Monitor komputer blank?',
    nextQuestionId: 5,
    nextFalseQuestionId: 7,
  ),
  Question(
    id: 5,
    text: 'Apakah Komputer sering mati mendadak?',
    nextQuestionId: 6,
    nextFalseQuestionId: 7,
  ),
  Question(
    id: 6,
    text: 'Apakah Kabel power telah terpasang dengan benar?',
    repairAdvice: RepairAdvice(
      id: 2,
      damage: 'Processor',
      advice: 'Gunakanlah RAM sesuai dengan spesifikasi laptop anda, hindari permukaan berdebu agar tidak terjadi overheating.',
    ),
  ),
  Question(
    id: 7,
    text: 'Apakah Suhu pada komputer cepat panas?',
    nextQuestionId: 8,
    nextFalseQuestionId: 10,
  ),
  Question(
    id: 8,
    text: 'Apakah Kipas pada motherboard longgar?',
    nextQuestionId: 9,
    nextFalseQuestionId: 10,
  ),
  Question(
    id: 9,
    text: 'Apakah Adanya bunyi bip panjang saat komputer dinyalakan?',
    repairAdvice: RepairAdvice(
      id: 3,
      damage: 'Motherboard',
      advice: 'Gunakan aplikasi seperlunya, memakai extra kipas tambahan, kurangi panas berlebih pada komputer.',
    ),
  ),
  Question(
    id: 10,
    text: 'Apakah Driver pada CD/DVD bermasalah?',
    nextQuestionId: 11,
    nextFalseQuestionId: 14,
  ),
  Question(
    id: 11,
    text: 'Apakah CD/DVD tidak terdeteksi pada saat proses untuk booting?',
    nextQuestionId: 12,
    nextFalseQuestionId: 14,
  ),
  Question(
    id: 12,
    text: 'Apakah Kabel yang terhubung kepada CD/DVD Drive (longgar) tidak terpasang dengan benar?',
    nextQuestionId: 13,
    nextFalseQuestionId: 14,
  ),
  Question(
    id: 13,
    text: 'Apakah Settingan pada jumper CD/DVD Drive salah letak?',
    repairAdvice: RepairAdvice(
      id: 4,
      damage: 'CD/DVD ROM',
      advice: 'Pastikan anda mendeteksi suhu Harddisk dengan memakai bantuan aplikasi Crystal Disk Info, pastikan konduktor chip tidak mengalami pemuaian melebihi batas ukuran.',
    ),
  ),
  Question(
    id: 14,
    text: 'Apakah Koneksi pada kabel harddisk tidak terpasang dengan benar?',
    nextQuestionId: 15,
    nextFalseQuestionId: 16,
  ),
  Question(
    id: 15,
    text: 'Apakah Hardisk tidak dapat terdeteksi saat booting?',
    repairAdvice: RepairAdvice(
      id: 5,
      damage: 'Harddisk',
      advice: 'Periksa kembali apakah kabel power terpasang dengan benar, Periksa kembali settingan BIO (Standard Serup) apakah Primary dan Secondary nya semua diset dengan Auto.',
    ),
  ),
  Question(
    id: 16,
    text: 'Apakah Monitor komputer blank?',
    nextQuestionId: 17,
    nextFalseQuestionId: null,
  ),
  Question(
    id: 17,
    text: 'Apakah Suhu PC yang tiba-tiba panas?',
    nextQuestionId: 18,
    nextFalseQuestionId: null,
  ),
  Question(
    id: 18,
    text: 'Apakah Layar monitor blue screen?',
    nextQuestionId: 19,
    nextFalseQuestionId: null,
  ),
  Question(
    id: 19,
    text: 'Apakah Ram terpasang dengan benar?',
    repairAdvice: RepairAdvice(
      id: 6,
      damage: 'RAM',
      advice: 'Keluarkan RAM dari slot, Periksa kembali posisi RAM pada slot, Selalu membersihkan bagian dari badan RAM.',
    ),
  ),
];

Question getQuestionById(int id) {
  return questions.firstWhere((question) => question.id == id);
}
