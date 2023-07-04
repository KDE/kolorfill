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

#include "highscore.h"

HighScore::HighScore(QObject* parent) : QObject(parent), m_size(-1)
{
}

QString HighScore::settingsStringForSize(int size) // static
{
    return QStringLiteral("HighScore/size_%1").arg(size);
}


void HighScore::setSize(int size) {
    if (size != m_size) {
        m_size = size;
        emit highscoreChanged();
    }
}

int HighScore::size() const
{
    return m_size;
}

int HighScore::highscore() const
{
    if (m_size < 1 ) {
        return -1;
    }
    int highscore = m_settings.value(settingsStringForSize(m_size),-1).toInt();
    if (highscore < 1) {
        return -1;
    }
    return highscore;
}

void HighScore::setHighscore(int highscore)
{
    if (m_size < 1 ) {
        return;
    }
    m_settings.setValue(settingsStringForSize(m_size), highscore);
    m_settings.sync();
    emit highscoreChanged();
}

QVariantList HighScore::allHighscores() const
{
    QVariantList result;
    for(int i = 0; i < 100 ; i++ ) {
        auto string = settingsStringForSize(i);
        if (m_settings.contains(string)) {
            result << QVariant::fromValue(HighScoreElement(i,m_settings.value(string).toInt()));
        }
    }
    return result;

}

#include "moc_highscore.cpp"
