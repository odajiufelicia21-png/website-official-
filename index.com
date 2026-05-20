```react
import React, { useState, useEffect } from 'react';
import { 
  Music, BookOpen, PlayCircle, Star, CheckCircle, 
  Clock, Award, Headphones, Disc, Settings, 
  Mic2, Share2, DollarSign, List, Info, ChevronRight,
  TrendingUp, Layers, Tool
} from 'lucide-react';

const App = () => {
  const [activeTab, setActiveTab] = useState('overview');
  const [activeModule, setActiveModule] = useState(0);

  const modules = [
    {
      title: "Modul 1: Bazele Muzicii",
      icon: <Music className="w-5 h-5" />,
      content: "Muzica este organizarea sunetului în timp. Dincolo de sunete frumoase, este un limbaj al frecvențelor.",
      lessons: [
        "Ce este muzica vs zgomotul",
        "Cum percepe creierul frecvențele",
        "Elementele fundamentale: Sunet, Frecvență, Vibrație",
        "Exercițiu: Identifică 5 ritmuri în mediul tău"
      ]
    },
    {
      title: "Modul 2: Teoria Muzicală Esențială",
      icon: <BookOpen className="w-5 h-5" />,
      content: "Alfabetul muzicii. Învățăm notele și modul în care ele interacționează.",
      lessons: [
        "Notele muzicale (C D E F G A B)",
        "Game Major vs Minor: Emoția în muzică",
        "Acorduri simple (Triade) și complexe",
        "Cum funcționează armonia",
        "Exercițiu: Construirea unei game de Do Major"
      ]
    },
    {
      title: "Modul 3: Ritm și Structură",
      icon: <Clock className="w-5 h-5" />,
      content: "Ritmul este scheletul oricărei piese. Fără un puls corect, muzica nu are energie.",
      lessons: [
        "Măsuri muzicale (4/4, 3/4, 6/8)",
        "BPM (Beats Per Minute) și Tempo",
        "Structura piesei: Intro, Vers, Refren, Bridge",
        "Exercițiu: Creează un beat simplu bătând din palme"
      ]
    },
    {
      title: "Modul 4: Instrumente Muzicale",
      icon: <Mic2 className="w-5 h-5" />,
      content: "De la instrumente clasice la cele virtuale (VST).",
      lessons: [
        "Pianul și Chitara: Fundamentele compoziției",
        "Tobe și Percuție: Motorul piesei",
        "Introducere în Instrumente Virtuale (VST)",
        "Ce îți trebuie ca începător (Buget mic)"
      ]
    },
    {
      title: "Modul 5: Producție Muzicală (DAW)",
      icon: <Settings className="w-5 h-5" />,
      content: "Digital Audio Workstation. Spațiul tău de lucru virtual.",
      lessons: [
        "Alegerea DAW-ului (FL Studio, Ableton, Logic)",
        "Configurarea primului proiect",
        "Beat making de la zero",
        "Sound design: Crearea propriilor sunete"
      ]
    },
    {
      title: "Modul 6: Compoziție Muzicală",
      icon: <Layers className="w-5 h-5" />,
      content: "Cum să scrii ceva care rămâne în mintea ascultătorului.",
      lessons: [
        "Hook-uri și Refrene memorabile",
        "Transmiterea emoției prin melodie",
        "Structura unei piese comerciale (Hit-making)",
        "Exercițiu: Compune o linie melodică de 4 măsuri"
      ]
    },
    {
      title: "Modul 7: Genuri Muzicale",
      icon: <Disc className="w-5 h-5" />,
      content: "Explorarea stilurilor și a modului în care ele au evoluat.",
      lessons: [
        "Pop, Rap, EDM, Rock, Jazz",
        "Evoluția genurilor și fuziuni moderne",
        "Elementele care definesc un stil",
        "Exercițiu: Identifică stilul tău semnătură"
      ]
    },
    {
      title: "Modul 8: Industria Muzicală Modernă",
      icon: <TrendingUp className="w-5 h-5" />,
      content: "Cum să navighezi în lumea digitală a muzicii.",
      lessons: [
        "Algoritmul Spotify și YouTube",
        "Drepturi de autor și Legalitate",
        "Distribuție digitală (DistroKid, TuneCore)",
        "Strategii de monetizare"
      ]
    },
    {
      title: "Modul 9: Brand Personal",
      icon: <Star className="w-5 h-5" />,
      content: "Artistul este un brand. Identitatea vizuală contează la fel de mult.",
      lessons: [
        "Alegerea numelui de scenă",
        "Prezența pe Social Media (TikTok/IG)",
        "Comunicarea cu fanii",
        "Exercițiu: Creează-ți conceptul vizual"
      ]
    },
    {
      title: "Modul 10: Lansarea Primei Piese",
      icon: <Share2 className="w-5 h-5" />,
      content: "Momentul zero: Piesa ta este gata de lume.",
      lessons: [
        "Mix & Master simplificat pentru început",
        "Planificarea campaniei de lansare",
        "Upload-ul corect pe platforme",
        "Analiza rezultatelor de după lansare"
      ]
    }
  ];

  const glossary = [
    { term: "BPM", def: "Beats Per Minute - viteza unei piese." },
    { term: "DAW", def: "Digital Audio Workstation - programul de producție muzicală." },
    { term: "EQ", def: "Equalizer - unealtă pentru ajustarea frecvențelor." },
    { term: "Reverb", def: "Efect ce simulează ecoul într-un spațiu." },
    { term: "VST", def: "Virtual Studio Technology - instrumente software." }
  ];

  const plan30Days = [
    { week: "Săptămâna 1", goal: "Teorie și Ritm", focus: "Modulele 1-3. Ascultă activ și identifică structuri." },
    { week: "Săptămâna 2", goal: "Producție & DAW", focus: "Modulele 4-5. Instalează un software și fă primul beat." },
    { week: "Săptămâna 3", goal: "Compoziție", focus: "Modulele 6-7. Scrie o melodie peste beat-ul tău." },
    { week: "Săptămâna 4", goal: "Branding & Lansare", focus: "Modulele 8-10. Pregătește fișierul final și urcă-l pe platforme." }
  ];

  return (
    <div className="min-h-screen bg-slate-50 font-sans text-slate-900">
      {/* Navigation */}
      <nav className="bg-indigo-900 text-white sticky top-0 z-50 shadow-lg">
        <div className="max-w-6xl mx-auto px-4 py-4 flex justify-between items-center">
          <div className="flex items-center space-x-2">
            <div className="bg-indigo-500 p-2 rounded-lg">
              <Music className="w-6 h-6 text-white" />
            </div>
            <span className="font-bold text-xl tracking-tight uppercase">Muzica <span className="text-indigo-300">0-PRO</span></span>
          </div>
          <div className="hidden md:flex space-x-6 text-sm font-medium uppercase tracking-wider">
            <button onClick={() => setActiveTab('overview')} className={`hover:text-indigo-300 transition ${activeTab === 'overview' ? 'text-indigo-300 border-b-2 border-indigo-300' : ''}`}>Curs</button>
            <button onClick={() => setActiveTab('plan')} className={`hover:text-indigo-300 transition ${activeTab === 'plan' ? 'text-indigo-300 border-b-2 border-indigo-300' : ''}`}>Plan 30 Zile</button>
            <button onClick={() => setActiveTab('resources')} className={`hover:text-indigo-300 transition ${activeTab === 'resources' ? 'text-indigo-300 border-b-2 border-indigo-300' : ''}`}>Resurse</button>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <header className="bg-gradient-to-br from-indigo-800 to-slate-900 text-white py-16 px-4 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-4xl md:text-6xl font-extrabold mb-4 leading-tight">
            Ghid Complet: De la Teorie la <span className="text-indigo-400 underline decoration-indigo-400/50">Prima Ta Piesă</span>
          </h1>
          <p className="text-lg md:text-xl text-indigo-100 mb-8 max-w-2xl mx-auto opacity-90">
            Învață să înțelegi, să creezi și să lansezi muzică în industria modernă, chiar dacă nu ai nicio experiență anterioară.
          </p>
          <div className="flex flex-col sm:flex-row justify-center gap-4">
            <button onClick={() => setActiveTab('overview')} className="bg-indigo-500 hover:bg-indigo-400 text-white px-8 py-4 rounded-full font-bold text-lg transition-all shadow-xl hover:-translate-y-1">
              Începe Acum Cursul
            </button>
            <button className="bg-white/10 hover:bg-white/20 backdrop-blur-sm text-white border border-white/30 px-8 py-4 rounded-full font-bold text-lg transition-all">
              Descarcă Ebook-ul PDF
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-4 py-12">
        {activeTab === 'overview' && (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Sidebar Modules */}
            <div className="lg:col-span-1 space-y-3">
              <h3 className="text-sm font-bold text-slate-400 uppercase tracking-widest mb-4">Modulele Cursului</h3>
              {modules.map((mod, idx) => (
                <button 
                  key={idx}
                  onClick={() => setActiveModule(idx)}
                  className={`w-full text-left p-4 rounded-xl border-2 transition-all flex items-center space-x-3 ${activeModule === idx ? 'border-indigo-500 bg-white shadow-md' : 'border-transparent hover:border-slate-200'}`}
                >
                  <div className={`p-2 rounded-lg ${activeModule === idx ? 'bg-indigo-100 text-indigo-600' : 'bg-slate-200 text-slate-500'}`}>
                    {mod.icon}
                  </div>
                  <span className={`font-semibold ${activeModule === idx ? 'text-indigo-900' : 'text-slate-600'}`}>{mod.title}</span>
                </button>
              ))}
            </div>

            {/* Content Area */}
            <div className="lg:col-span-2">
              <div className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100 min-h-[600px]">
                <div className="flex items-center space-x-3 mb-6">
                  <span className="bg-indigo-100 text-indigo-700 px-3 py-1 rounded-full text-xs font-bold uppercase">Lecția Curentă</span>
                  <div className="h-px flex-1 bg-slate-100"></div>
                </div>
                
                <h2 className="text-3xl font-bold text-slate-900 mb-4">{modules[activeModule].title}</h2>
                <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                  {modules[activeModule].content}
                </p>

                <div className="space-y-4 mb-10">
                  <h4 className="font-bold text-slate-800 flex items-center">
                    <List className="w-4 h-4 mr-2" /> Ce vei învăța:
                  </h4>
                  {modules[activeModule].lessons.map((lesson, i) => (
                    <div key={i} className="flex items-start space-x-3 p-4 bg-slate-50 rounded-2xl border border-slate-100">
                      <div className="mt-1">
                        <CheckCircle className="w-5 h-5 text-green-500" />
                      </div>
                      <span className="text-slate-700 font-medium">{lesson}</span>
                    </div>
                  ))}
                </div>

                <div className="bg-indigo-50 p-6 rounded-3xl border border-indigo-100">
                  <h4 className="text-indigo-900 font-bold mb-2 flex items-center">
                    <PlayCircle className="w-5 h-5 mr-2" /> Exercițiu Practic
                  </h4>
                  <p className="text-indigo-800/80 mb-4 italic">
                    {modules[activeModule].title.includes("Modul 10") ? "Gata! Acum creează-ți planul de lansare și trimite-ne progresul." : "Pune în aplicare ce ai învățat astăzi."}
                  </p>
                  <button className="bg-indigo-600 text-white px-6 py-2 rounded-xl font-bold text-sm hover:bg-indigo-700 transition">
                    Marchează ca Finalizat
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}

        {activeTab === 'plan' && (
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl font-bold text-center mb-10">Călătoria Ta de 30 de Zile</h2>
            <div className="space-y-6">
              {plan30Days.map((p, idx) => (
                <div key={idx} className="bg-white p-6 rounded-3xl shadow-sm border border-slate-100 flex flex-col md:flex-row md:items-center gap-6">
                  <div className="bg-indigo-900 text-white w-full md:w-40 h-24 flex flex-col items-center justify-center rounded-2xl shrink-0">
                    <span className="text-xs uppercase opacity-70">Interval</span>
                    <span className="text-xl font-bold">{p.week}</span>
                  </div>
                  <div className="flex-1">
                    <h4 className="text-xl font-bold text-slate-900 mb-1">{p.goal}</h4>
                    <p className="text-slate-600">{p.focus}</p>
                  </div>
                  <ChevronRight className="hidden md:block w-6 h-6 text-slate-300" />
                </div>
              ))}
            </div>
          </div>
        )}

        {activeTab === 'resources' && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="bg-white p-8 rounded-3xl shadow-sm border border-slate-100">
              <h3 className="text-2xl font-bold mb-6 flex items-center">
                <Info className="w-6 h-6 mr-2 text-indigo-500" /> Glosar de Termeni
              </h3>
              <div className="space-y-4">
                {glossary.map((g, idx) => (
                  <div key={idx} className="border-b border-slate-50 pb-4">
                    <span className="font-bold text-indigo-600 uppercase tracking-tighter">{g.term}</span>
                    <p className="text-slate-600 text-sm mt-1">{g.def}</p>
                  </div>
                ))}
              </div>
            </div>

            <div className="bg-white p-8 rounded-3xl shadow-sm border border-slate-100">
              <h3 className="text-2xl font-bold mb-6 flex items-center">
                <Tool className="w-6 h-6 mr-2 text-indigo-500" /> Resurse Recomandate
              </h3>
              <div className="grid grid-cols-1 gap-4">
                <div className="p-4 bg-slate-50 rounded-2xl border border-slate-100">
                  <h4 className="font-bold">Software (DAW)</h4>
                  <p className="text-xs text-slate-500">Ableton Live, FL Studio, BandLab (Moca)</p>
                </div>
                <div className="p-4 bg-slate-50 rounded-2xl border border-slate-100">
                  <h4 className="font-bold">Samples & Sunete</h4>
                  <p className="text-xs text-slate-500">Splice, Looperman, Cymatics</p>
                </div>
                <div className="p-4 bg-slate-50 rounded-2xl border border-slate-100">
                  <h4 className="font-bold">Distribuție</h4>
                  <p className="text-xs text-slate-500">DistroKid (20$/an), Amuse (Gratis)</p>
                </div>
                <div className="p-4 bg-indigo-900 text-white rounded-2xl">
                  <h4 className="font-bold flex items-center italic">
                    <Award className="w-4 h-4 mr-2" /> Checklist Producție
                  </h4>
                  <ul className="text-xs mt-2 space-y-1 opacity-90">
                    <li>✓ Melodie compusă</li>
                    <li>✓ Beat structurat (Intro-Refren)</li>
                    <li>✓ EQ aplicat pe instrumente</li>
                    <li>✓ Export format WAV 24-bit</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        )}
      </main>

      {/* Pricing Teaser */}
      <section className="bg-slate-100 py-16 px-4">
        <div className="max-w-6xl mx-auto text-center">
          <h2 className="text-3xl font-bold mb-12">Alege Pachetul Tău</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm transition-transform hover:-translate-y-2">
              <h4 className="text-xl font-bold">BASIC</h4>
              <p className="text-slate-500 text-sm mb-6">Ebook + Module Text</p>
              <div className="text-4xl font-black mb-6">19€</div>
              <ul className="text-left space-y-3 mb-8 text-sm text-slate-600">
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-500"/> Acces 10 Module</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-500"/> Glosar complet</li>
                <li className="flex items-center opacity-40"><CheckCircle className="w-4 h-4 mr-2 text-slate-300"/> Tutoriale Video</li>
              </ul>
              <button className="w-full py-3 border-2 border-indigo-600 text-indigo-600 rounded-xl font-bold hover:bg-indigo-600 hover:text-white transition">Cumpără</button>
            </div>

            <div className="bg-indigo-900 text-white p-8 rounded-3xl border-4 border-indigo-400 shadow-2xl scale-105 relative overflow-hidden transition-transform hover:-translate-y-2">
              <div className="absolute top-4 right-4 bg-indigo-400 text-white text-[10px] font-bold px-2 py-1 rounded">BEST SELLER</div>
              <h4 className="text-xl font-bold">PRO</h4>
              <p className="text-indigo-200 text-sm mb-6">Video + Resurse + DAW Masterclass</p>
              <div className="text-4xl font-black mb-6">49€</div>
              <ul className="text-left space-y-3 mb-8 text-sm text-indigo-100">
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-400"/> Tot ce e în Basic</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-400"/> 12 Video Tutoriale</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-400"/> Pack de sample-uri</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-400"/> Checklist lansare</li>
              </ul>
              <button className="w-full py-3 bg-indigo-500 text-white rounded-xl font-bold hover:bg-indigo-400 transition shadow-lg">Obține Pro</button>
            </div>

            <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm transition-transform hover:-translate-y-2">
              <h4 className="text-xl font-bold">PREMIUM</h4>
              <p className="text-slate-500 text-sm mb-6">Feedback Personalizat</p>
              <div className="text-4xl font-black mb-6">99€</div>
              <ul className="text-left space-y-3 mb-8 text-sm text-slate-600">
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-500"/> Tot ce e în Pro</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-500"/> Feedback pe prima piesă</li>
                <li className="flex items-center"><CheckCircle className="w-4 h-4 mr-2 text-indigo-500"/> Plan de marketing</li>
              </ul>
              <button className="w-full py-3 border-2 border-indigo-600 text-indigo-600 rounded-xl font-bold hover:bg-indigo-600 hover:text-white transition">Cumpără</button>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-slate-900 text-slate-400 py-12 px-4 border-t border-slate-800">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row justify-between items-center gap-6">
          <div className="flex items-center space-x-2">
            <Music className="w-5 h-5 text-indigo-500" />
            <span className="font-bold text-white tracking-tight uppercase">Muzica 0-PRO</span>
          </div>
          <p className="text-xs uppercase tracking-widest">&copy; 2024 Muzica De La Zero La Pro. Toate drepturile rezervate.</p>
          <div className="flex space-x-4">
            <Share2 className="w-5 h-5 cursor-pointer hover:text-indigo-400 transition" />
            <Headphones className="w-5 h-5 cursor-pointer hover:text-indigo-400 transition" />
          </div>
        </div>
      </footer>
    </div>
  );
};

export default App;

```
