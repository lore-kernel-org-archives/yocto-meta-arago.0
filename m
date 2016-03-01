Return-Path: <ticotimo@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by arago-project.org (Postfix) with ESMTPS id BA79252A87
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 03:46:32 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 4so25985074pfd.1
	for <meta-arago@arago-project.org>;
	Mon, 29 Feb 2016 19:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=Qa1VyUPOhtxmtd73+0hOExqohx99IEJDtyXkWDXRA18=;
	b=EtYXWevhjyEuslEc7WymGLdoikD/RddHIwasv3NPh/Jam2z6S0sQ+M/ab/Agu9udYf
	8cMMm9jkzRm9RhhZ9wFNCkx6AGEdHa3PR+1T9QK8GvD+jYTU8wd80JaurwWPWIFh25AU
	dKFPLtjPtYMYoMUxqCLF0h9L+WKX28aV2YEZFa/HvNbffw2GetHUVrKHhOQraQl4wmBF
	bgINxIPScAOdT+D6QWomXQ1X1fcPggbmPGbrY64Ao7Zb6U3L8PYwVa+QDABLZU+0LXBx
	zAUgsuN5BfY8q+PXIXx7kBLescmvaQQZrpA7G40ezinWRKh5tJ+F+SyBrzN6JU++Gvcx
	U6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=Qa1VyUPOhtxmtd73+0hOExqohx99IEJDtyXkWDXRA18=;
	b=Wg9x1g9sEYr1NxxaPeXMKWEFR4rM6t3y8FB3gyVVaPrEIty9a5Z0P+PWT5rnmvVAC6
	nfrJQ+HBSaXZKCdvOQLL6Q5oefnhekIQ6pTciMxxutVJ/kOleMkFP+gwSH2giA3zd3S5
	u0D1BfG4ZzAq81KuwY4bGtmkUNwFFpjB1ldSfqsvAbiPzXGYx0MMcOa3ofJA4mGYZmsc
	eUrtDgiPC1RjTbm4cas1UIIbrP9FJjj1Kt3xZTa1KtCCDpGKznuRNFh3TRsTLK++Nrsf
	16HQ7UQrN9hey10pmndgo46nLr9SVuCEJqTIQGjE4k7jFKs0mY+bTiou3fZbDyzOWISr
	Wm8g==
X-Gm-Message-State: AD7BkJKiS320VM6hKvmVBIO1X+9owbErL0gM5VtDSzfWcqimsE32r5IzynNTvJD1EqpkiQ==
X-Received: by 10.98.32.218 with SMTP id m87mr26990750pfj.48.1456803991905;
	Mon, 29 Feb 2016 19:46:31 -0800 (PST)
Received: from [10.0.0.194] (c-76-115-105-5.hsd1.or.comcast.net.
	[76.115.105.5]) by smtp.gmail.com with ESMTPSA id
	cq9sm41307920pac.26.2016.02.29.19.46.30
	for <meta-arago@arago-project.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 19:46:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <A78912DB-197C-4868-971C-25C34F2578BF@gmail.com>
Date: Mon, 29 Feb 2016 19:46:29 -0800
To: meta-arago@arago-project.org
X-Mailer: iPhone Mail (13D15)
Subject: Plans for jethro?
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
X-List-Received-Date: Tue, 01 Mar 2016 03:46:33 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

New to the list; curious if there is a planned schedule for a jethro branch?=


I have some Beagleboard related trees that would appreciate a jethro update :=
)

--Tim=

