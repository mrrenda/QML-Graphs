#include "core.h"

core::core(QObject *parent) : QObject(parent)
{
    m_data = 0;
}

int core::getValue()
{
    return m_data;
}

void core::setValue(int data)
{
    m_data = data;    

    emit sendData();
}

void core::startAddingData()
{
    QtConcurrent::run(this, &core::m_randomGenerator);
}

void core::m_randomGenerator()
{
//    qsrand(QDateTime::currentDateTime().time().second());

    while (true) {
        int randomNumber = qrand() % 300;
        qDebug() << "random number generated" << randomNumber;
        setValue(randomNumber);
        QThread::msleep(200);
    }
}

