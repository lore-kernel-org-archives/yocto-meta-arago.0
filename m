Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by arago-project.org (Postfix) with ESMTPS id B216E529B5
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 20:18:30 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id h20so6902705otn.5
	for <meta-arago@arago-project.org>;
	Fri, 06 Dec 2019 12:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cCDWaUfqqEA/wQJA61eDdpbcYudQKooKLjaedK9KlUE=;
	b=kc6fHN+X4ZGwfG9EEbMqU2fArWOXnG2gFzATg/2zOlmotfhjJIORuhDH3f0WGhxZZu
	RLpvZht0G2U+KX3D6R4qNp7WTMKhmakM0a3BMJ/vwj0RMALFdzUrVAFxnex1MUgUawai
	aioXC7I3bodSquXfZ3hEBHqgZ4PnBn1ZDI7zi5q7l31shqd6dD8JKPKAGA59OlgdjZsn
	+LIV9/qYucdNEGcH17geOLT+D8xI4SIiCUxd4bjesiUtCq6i6pKzELL3T4AAuWewX/+w
	hnE7iT7yS6MQnU9T6WbfI1lKZ9KQRmUm+Lh+GtQl3o3dQdoER+gjH2bSjvO+axO8oORv
	qcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cCDWaUfqqEA/wQJA61eDdpbcYudQKooKLjaedK9KlUE=;
	b=UA5O/thw6pDYJJ+LQtzFWnBLAXH3EvSOBF6vApF/Faw/K8Xoq+532FS+zNFA0m3NJJ
	xiPdHMZwDaUx/yQzegMEwP01lNTh0olYmbKP6Zc6Ofrqzz7Yq4qMBapIES3qKdbYGQQn
	4smaumiaAPqxLGFYaz7RyzfGE/jlD2hCbMuLGgixuOKfqQ7b0SmKk1MVxEML7vaRSGnp
	aY6iNdGPBg+XcpDWnkjwLQNsOOS2Q93WmTW5d2I7AYpRnvtN9H0xNzYHWOt8LQvTzg1C
	oYZlZyy9lEl8oa9EBQjCFFZxZq+aIDUiRl6Ox2U3WWLIfUDjaF7J/B62f89MWd2uu+v8
	Fqpg==
X-Gm-Message-State: APjAAAVml0ePBxurWUQvQ+txAvqsuP8+l3PGf9VTpozWD3H7misbzsPm
	PZV7VIy0zDTcnF4/DVWNoRe83HK5sHU=
X-Google-Smtp-Source: APXvYqxqcpYpdZi55nLIeIMWQcnNRG9ZJr7VsCspH/25QqTs23ID323ifx2QiWhsgNcGhnVnPsqHUg==
X-Received: by 2002:a9d:7cd9:: with SMTP id r25mr12115443otn.326.1575663417583;
	Fri, 06 Dec 2019 12:16:57 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	f83sm5276155oia.43.2019.12.06.12.16.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 12:16:56 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Dec 2019 14:16:39 -0600
Message-Id: <20191206201639.18381-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206201639.18381-1-hnagalla@gmail.com>
References: <20191206201639.18381-1-hnagalla@gmail.com>
Subject: [ 0/1] *** Use wireless-regdb-static ***
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Dec 2019 20:18:31 -0000

*** BLURB HERE ***

Hari Nagalla (1):
  Use wireless-regdb-static for K4.15 and later

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


