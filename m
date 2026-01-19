Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36629D3EE95
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 16:43:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34764.1768828045488044559
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 05:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfBN92B9;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b87cc82fd85so184147566b.2
        for <meta-arago@lists.yoctoproject.org>; Mon, 19 Jan 2026 05:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768828044; x=1769432844; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLwrq3a+3TyxBZztanmHHSuleBJeOrjRz7pJNOtUaiE=;
        b=JfBN92B99n0t2ANfzqKo1PzDjpdIDOFmCBKXdPgjKzQy7nZAt97ccZ2MmBQZSqHkzq
         XA1wLy4jSdv6JBeNWCnp2yIbEU1nEz6JUo9PepJjvYS0Q52PG75Mxk3GSEj7LH+quoWE
         iyOREFuWBz+0Z0gEIZlTAT0SImOiEozyGUfdFWkxnCSs5AXBOzdaHbXyLTJP0Feie0Fy
         I0EHAx6DxdKf5nI39O8YWCF0Isp6EVG1cl2fOzXyk/Ak43dxAJk2fPJBO0umYYBrnZqj
         6yyqDREGqD7dU0ypnJ3WJMK05RNzagMOt9/V/+EaTdmRsrIY6pa07345OCcDr3n0v+ov
         pLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828044; x=1769432844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLwrq3a+3TyxBZztanmHHSuleBJeOrjRz7pJNOtUaiE=;
        b=NQfjSHxs9lhBk40dE+bYO5MiXT2ESx5W1fnsE+e7OIjr6OuQadr8rE4ZdU4d7Z5gWq
         ulRf2Zqtmbszv7OtdfR4aZf4HMq3yNeHWUTJPlqQWmrMGY1Aw2K/xjoxH3G1Jr1bqmPj
         ghv9cx+dYpDvTqUr4V38lV+dQ4UoUjqfcTzpOGeKRrvnmJXZBkA+sh5pOu4YTr/6qb39
         5XIQwNnZOBvpu0fgdDfWnE2oJo7+N9RB13g5ps3zw0zbv+D2flMKWgWy0sE7UY7vc02A
         1dPv70k3u09PR4C4bNMNpEzEmxaw9xsYAOS1GJJpQY9z4ZKNytDyZTE43fVZe9F//2Ln
         pknQ==
X-Forwarded-Encrypted: i=1; AJvYcCXroOZvcrJTPqsz/Paa/v+51EPkiEmJWyR7fFPUx9B5CtOjx0kNvv5TMU41+dCmjKguuq7/o6ra7LxV@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxRxN+ZGSKcYmbOzwDmtKQTaQp0V6ciO4gx6+qjlHubiRCCWWsi
	72WOSylfeU6bdn1K2mAWKIIgxXkQcW5WIyIA/vMExCrikc6ibLqkcwDyUbV1OQ==
X-Gm-Gg: AY/fxX7K2cKo/iWLJptpcR8HCf4zEgeivQKiq4rIHeip0e+WC2arVxv/e83D+MXVags
	tAilY/saaplaCAy9q3mAV57X9bHUZN0tKqgONbyHSrodscf0Y/2gq0eQ1y37GwRMsBGMBG6vdL+
	tfWAJJ3B5k6Nq8O+zYMTx2J0rzwXQoUoYeTAafUGkNfaL234cPIQBqmXTBeh9xI5QVyLusk23cd
	HMYcCauDgkePEGIrqhnswSdsUtpHjDp/8KSCPpCHlqiA+qkQpAX1VRcG53mUlZZX3RAXQA20fAa
	cMgR/D4j8NI4kD6mADcmvHXBDiDKbZhuHnaFP/bFt4jZuyPtRAoauXOU4uV6ettimjeZwpvUH/1
	FZLP+RTCHC9ddHT3MdIKup0iWMfAExlXVL/0CM3w1QGSCbZTxJotfSyixquaESmBDxA57pzLHnp
	v1/7Pg3zqTAtPXoGp5u4nqJ+xBjsgvfS8kS9ZWhHdG3/U/SUpwFeH2YofL78AZqkQmKWsloudJl
	HbS9cF6ElDBVz7dsgr/Q7OWV94=
X-Received: by 2002:a5d:5d03:0:b0:431:a50:6ead with SMTP id ffacd0b85a97d-4356a02c4e5mr12892321f8f.20.1768827591144;
        Mon, 19 Jan 2026 04:59:51 -0800 (PST)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm22620384f8f.18.2026.01.19.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:59:50 -0800 (PST)
From: max.oss.09@gmail.com
To: reatmon@ti.com
Cc: denis@denix.org,
	denys@konsulko.com,
	meta-arago@lists.yoctoproject.org,
	praneeth@ti.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix package names for alsa-utils-*
Date: Mon, 19 Jan 2026 13:59:28 +0100
Message-ID: <20260119125927.646098-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <3b1583b6-bd10-4dcb-b339-57d37c0c7049@ti.com>
References: <3b1583b6-bd10-4dcb-b339-57d37c0c7049@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 16:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17008

From: Max Krummenacher <max.krummenacher@toradex.com>

Hi

FYI.

I run into issues installing alsa-utils. Some of the dynamically split
packages are empty making alsa-utils depend on empty packages which
made do_rootfs fail.

I guess you will run eventually into the same issue.

I sent a patch which works around the issue:

https://lore.kernel.org/all/20260119124722.646039-1-max.oss.09@gmail.com/

Regards
Max

