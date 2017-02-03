Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by arago-project.org (Postfix) with ESMTPS id B848D52AFC
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 00:27:05 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id v200so2574853ywc.3
	for <meta-arago@arago-project.org>;
	Thu, 02 Feb 2017 16:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6XnXsHr/NnUYYLw9Zp1KEWV2ipjkLJ1wEXrwbnWyXkE=;
	b=Y0+42X6qS0F/QuAa6KOL6rCczcKfitfMhNs7HH0UYmsnXUCHj04VVpSzCpCnBqm7Y5
	z1HsY1uRO1oALG60RO63s3B22SfdHqkBBAAA+tC12jTTXNqJQbnksmRB94pAwcAAAgyV
	S+YF5IQnG0HqO4dDAw7IUda/L109vQVZpCq5hvXJ21qMW0bvgsvr4GQuMTrw7C/9QYt1
	Hs+qqljseUPYhsPu60uO5D4ScHBzONh8syHfqUOMsr9w9Al7xlmfuq4Kk1CoB/f7QYCF
	PNgGZoztPslD6kcx99IfHHpUdWmBfNFPj4VvXSORC+xK1OX0t2j1DO0sHwxZj0DkrXrg
	Wv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6XnXsHr/NnUYYLw9Zp1KEWV2ipjkLJ1wEXrwbnWyXkE=;
	b=Yfw0xhJ7BeCMKkTzIrnc7AympwzbEg8kC+4Uuzsx5p+kAWlhvlLct+JDfNtpQnQ/S8
	ppvFTMLikMJm9AgIIbwwSRfPo7y3eE+BwLxU0vJetRc4zkgBBat2qjRars3myjQzkhG7
	h4SzUe6hQOMkkQ/jm/n7sinxPIhBub63j1qIbG3y9PIgYy6oYtpw5YiUiTfXtnrltNTB
	W1HdkfNncVR86WALzgc9859q3SMYMKqnRIFtM1HXqry8m0Gb7WQgbO+MIVvWniyZkNyh
	x1uceTEFMI5fVmJBGognnaoFWdlWozETie9JVFiSyBaejBU8w13GvqmSUF0kwRuT1SXV
	JLpw==
X-Gm-Message-State: AIkVDXLmGz3PzxRDnukFz9VsbkGpK86CRue+fCzHKDqVJZyw6EmN6QPcNU1SZNAkHAqWhAylSgP8jBMfLcMosQ==
X-Received: by 10.13.248.198 with SMTP id i189mr7622393ywf.274.1486081618664; 
	Thu, 02 Feb 2017 16:26:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Thu, 2 Feb 2017 16:26:38 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 3 Feb 2017 13:26:38 +1300
Message-ID: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: How to remove linux headers from rootfs
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
X-List-Received-Date: Fri, 03 Feb 2017 00:27:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have an image recipe which include packagegroup-core-boot which
brings in external-linaro-toolchain which in turn adds
linux-libc-headers.

How can I remove linux-libc-headers from my end root FS ?

Thanks
Ankur

