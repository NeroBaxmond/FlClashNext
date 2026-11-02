package com.follow.clashx.service.models

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class NotificationParams(
    val title: String = "FlClash Next",
    val stopText: String = "Stop",
) : Parcelable
