/*
 * Copyright (c) 2018 Sune Vuorela <sune@vuorela.dk>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
#pragma once
#include <QObject>
#include <QSettings>
#include <QVariantMap>

/**
 * Helper class representing a element in the high score list
 */
class HighScoreElement {
    Q_GADGET
    Q_PROPERTY(int size READ size)
    Q_PROPERTY(int highscore READ highscore)
    int m_size;
    int m_score;
public:
    HighScoreElement(int size, int score) : m_size(size), m_score(score) {}
    HighScoreElement() : m_size(-1), m_score(-1) {}
    int size() const {
        return m_size;
    }
    int highscore() const {
        return m_score;
    }
};
Q_DECLARE_METATYPE(HighScoreElement)

/**
 * High score class
 *
 * Uses QSettings as a backend and stores the best result for each
 * board size.
 */
class HighScore : public QObject
{
    Q_OBJECT
    /** The current board size that the highscore is handled for */
    Q_PROPERTY(int size READ size WRITE setSize NOTIFY highscoreChanged)
    /** The highscore for the selected board size, or -1 if there is no high score*/
    Q_PROPERTY(int highscore READ highscore WRITE setHighscore NOTIFY highscoreChanged)
    /** All highscores as a list of HighScoreElement*/
    Q_PROPERTY(QVariantList allHighscores READ allHighscores NOTIFY highscoreChanged)
    int m_size;
    QSettings m_settings;
    static QString settingsStringForSize(int size);
public:
    HighScore(QObject* parent = nullptr);

    int size() const;
    void setSize(int size);
    int highscore() const;
    void setHighscore(int highscore);
    /**
     * List of high score elements
     */
    QVariantList allHighscores() const;

Q_SIGNALS:
    void highscoreChanged();

};
