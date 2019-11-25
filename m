Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by arago-project.org (Postfix) with ESMTPS id 7F77E529C0
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 16:06:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id s71so13518884oih.11
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H+by9ANbypbb8S/XTNpPPNhs6wHaV0qQRrkwOegz9t4=;
	b=h2UkB0fpMuErKcNC9EaTI9acPA9a6PvY9GpsueIiuVftIt11Azvh2w9SI2nGQha3dr
	Xe8sh70qHXgTA5XUzzhxk+fRj8D4zna3ffeik+yOclgG55uKzCwLz4LA9tu+Qtxx8o3n
	CkhiN9PoOjCb6sM7igeVMBYoVZXY/B1a2RYGb5i28lcAk3Q+nnX6DA1CiyI1xe85qhEF
	FRiLnFIUrhpdKX3/Gqofooq5tPGWgbB00bZUav+ZGSUZ6fQxJt4BO5XleaUpHSK5JxCs
	tdA8VUjmWwzG4C1MqRJtXg9yezhnY2AMCpb/++ImbVB7nz8cSg2SXi48GB8J/8X1Hv6Z
	3BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H+by9ANbypbb8S/XTNpPPNhs6wHaV0qQRrkwOegz9t4=;
	b=RNapoDogC/CrKlUzCs4Sm3GTkSopQ3BwJOAuuXQ14YUQJcU22+xn+6KE4h0Ike7Ozh
	jkaqfYUCN/6hyAANTGAeb0ua7v4XHwCZ/Cg3c+6N0usRg4E97z4clKtpjHU3pTZRA2SJ
	yP1b9ptkdOhJDOuT6QkmdzyjhEx7H/vF7KyV/oojTMU4F80o0SQ6A79dypidclTooLLO
	Xc+e0o71+bMeQPTDYpkzYMkkZmDtNOiOwnACAspy69LRaXFo9ZTK7PEmr0h0vL9VGIhr
	+puOy/0Kh/k0guzdez6JLJMmgnJmECQAH5uOLr5+1CHf7U+d90zFHnJ4PJ6YBNNh/+sz
	b3IQ==
X-Gm-Message-State: APjAAAW33mJwt8sXcF+lQZsnCclfA9m07OSb4xVWhssD1b1C/zhJ3ikL
	VJ+19NQpMwDDKA742pefYByFTxU1KlI=
X-Google-Smtp-Source: APXvYqw3smZ+9+s66ep+e4E8CHhkAVrQ3pTCi4CBJjDz3XGT6YUiuVVRYP4o/OXNZEf78wHDK8qIig==
X-Received: by 2002:aca:d6d7:: with SMTP id
	n206mr23802571oig.147.1574697878867; 
	Mon, 25 Nov 2019 08:04:38 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	v11sm2517693ota.13.2019.11.25.08.04.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 08:04:38 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Nov 2019 10:04:18 -0600
Message-Id: <20191125160419.4096-1-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [ 0/1] *** Include wireless-regdb/crda ***
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
X-List-Received-Date: Mon, 25 Nov 2019 16:06:08 -0000

*** BLURB HERE ***

Hari Nagalla (1):
  Include wireless-regdb/crda

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb      | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1


