#ifndef CORE_H
#define CORE_H

#include <QObject>
#include <QRandomGenerator>
#include <QDateTime>
#include <QtConcurrent/QtConcurrent>
#include <QDebug>

class core : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int workload READ getValue WRITE setValue NOTIFY sendData)

public:
    explicit core(QObject *parent = nullptr);

    int getValue();
    void setValue(int data);

signals:
    void sendData();

public slots:
    void startAddingData();

private:
    int m_data;
    void m_randomGenerator();
};

#endif // CORE_H
