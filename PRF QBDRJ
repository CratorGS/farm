"use client";

import { useEffect, useRef, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";

const ranks = [
  "Recruta",
  "Agente",
  "Agente Especial",
  "Inspetor",
  "Supervisor",
  "Comando",
  "Comando Geral",
];

export default function PRFMilitaryCore() {
  const [page, setPage] = useState("dashboard");

  const audioRef = useRef<HTMLAudioElement | null>(null);

  const [profile, setProfile] = useState({
    name: "Operador PRF",
    rank: "Recruta",
    xp: 0,
    missions: 0,
  });

  const [radio, setRadio] = useState([
    "QAP — Sistema inicializado",
    "QTH — Central operacional ativa",
  ]);

  // 🔥 CARREGAR LOCALSTORAGE (CLIENT ONLY)
  useEffect(() => {
    const saved = localStorage.getItem("prf_military");
    if (saved) setProfile(JSON.parse(saved));
  }, []);

  // 💾 SALVAR
  useEffect(() => {
    localStorage.setItem("prf_military", JSON.stringify(profile));
  }, [profile]);

  // 🎧 AUDIO
  useEffect(() => {
    if (audioRef.current) {
      audioRef.current.volume = 0.2;
      audioRef.current.play().catch(() => {});
    }
  }, []);

  // 📡 RADIO
  useEffect(() => {
    const interval = setInterval(() => {
      const msgs = [
        "QAP — Patrulha ativa na BR-040",
        "ALERTA — Movimento suspeito detectado",
        "QTH — Unidade reposicionada",
        "CÓDIGO 5 — Operação em andamento",
      ];

      setRadio((prev) => [
        msgs[Math.floor(Math.random() * msgs.length)],
        ...prev.slice(0, 6),
      ]);
    }, 3500);

    return () => clearInterval(interval);
  }, []);

  const addXP = () => {
    let xp = profile.xp + 25;
    let idx = ranks.indexOf(profile.rank);

    if (xp >= 100 && idx < ranks.length - 1) {
      xp = 0;
      idx++;
    }

    setProfile({
      ...profile,
      xp,
      rank: ranks[idx],
      missions: profile.missions + 1,
    });
  };

  return (
    <div className="min-h-screen text-white bg-black overflow-hidden relative">

      {/* VIDEO */}
      <div className="fixed inset-0 z-0">
        <iframe
          className="w-full h-full scale-125 opacity-40 pointer-events-none"
          src="https://www.youtube.com/embed/-He5xYWa8kY?autoplay=1&mute=1&controls=0&loop=1&playlist=-He5xYWa8kY"
        />
        <div className="absolute inset-0 bg-black/70" />
      </div>

      {/* AUDIO */}
      <audio
        ref={audioRef}
        src="https://cdn.pixabay.com/download/audio/2022/03/15/audio_c8c8a73467.mp3"
      />

      {/* HEADER */}
      <div className="fixed top-0 w-full z-50 bg-black/80 border-b border-green-500/30">
        <div className="max-w-7xl mx-auto flex justify-between px-6 py-4">
          <h1 className="text-green-400 font-black tracking-[0.3em]">
            PRF MILITARY SYSTEM
          </h1>

          <div className="flex gap-2">
            {["dashboard", "academy", "missions", "radio", "profile"].map(
              (p) => (
                <button
                  key={p}
                  onClick={() => setPage(p)}
                  className="px-3 py-1 text-xs border border-green-500/30"
                >
                  {p.toUpperCase()}
                </button>
              )
            )}
          </div>
        </div>
      </div>

      {/* CONTENT */}
      <div className="pt-28 max-w-6xl mx-auto px-6 relative z-10">

        <AnimatePresence mode="wait">

          {page === "dashboard" && (
            <motion.div key="dash">
              <h2 className="text-5xl font-black text-green-400">
                CENTRO DE OPERAÇÕES
              </h2>

              <div className="grid md:grid-cols-3 gap-6 mt-10">

                <div className="p-6 border border-green-500/30 bg-black/60 rounded-xl">
                  <p>PATENTE</p>
                  <h3 className="font-black">{profile.rank}</h3>
                </div>

                <div className="p-6 border border-green-500/30 bg-black/60 rounded-xl">
                  <p>XP</p>
                  <h3>{profile.xp}/100</h3>
                  <button onClick={addXP} className="mt-4 bg-green-500 text-black px-3 py-1">
                    SIMULAR OPERAÇÃO
                  </button>
                </div>

                <div className="p-6 border border-green-500/30 bg-black/60 rounded-xl">
                  <p>MISSÕES</p>
                  <h3>{profile.missions}</h3>
                </div>

              </div>
            </motion.div>
          )}

        </AnimatePresence>
      </div>
    </div>
  );
}
