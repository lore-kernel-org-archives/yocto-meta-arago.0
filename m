Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by arago-project.org (Postfix) with ESMTPS id EBA6352AB3
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 09:08:36 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so8750646ieb.1
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yxNXG+bBf3qjmDH7DqUfkB6BKIN8dwsqJplgrALbFzQ=;
	b=RRaaTpd4FY34MdLi5opvo33skNJb7M9nRqd8bSaV5CYHgNljKQlqmNaL1Amqqbn2qo
	LS88ebJf9bLBwo213n67TP+hcwVCxbfv5GQ9BMChHj+CWZjL52Yefxssz2Bb1zT3JS10
	f/sxJQE5RBH3AQNwnSr6d9XqdP2R21qkszxvMjvB44bf9QZTukU3yeQJIN6AmiUHk1DW
	H4XikUJUaOrAbi7G/ITXsOJmRQIg1UAI9EyBUTVJ2kz9hfde27com5t/u5vAgucw7Un0
	njriE7ow5zF46euGVZ4kA5g+rFNcHFm6iLy4QvVIl1KhO96Ww/QYCj/oRwH4PeMJs6kc
	B46A==
MIME-Version: 1.0
X-Received: by 10.42.88.197 with SMTP id d5mr1770191icm.44.1434445716164; Tue,
	16 Jun 2015 02:08:36 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Tue, 16 Jun 2015 02:08:36 -0700 (PDT)
Date: Tue, 16 Jun 2015 12:08:36 +0300
Message-ID: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: overriding arago.conf settings
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
X-List-Received-Date: Tue, 16 Jun 2015 09:08:37 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fd2815c988705189eeb9e

--90e6ba3fd2815c988705189eeb9e
Content-Type: text/plain; charset=UTF-8

Hi!
Do anyone know how to overriding variables set in arago.conf using
layer.conf or local.conf settings (or anything else that touching Arago
layer). I try to set something else on my own layer
(PREFERRED_VERSION_u-boot). I have tried changing layer orders in
bblayers.conf and priority in layer.conf. In fact if I got it right from
Yocto documentation distro.conf is just parsed first and that is what rules.
Thanks,
Matti

--90e6ba3fd2815c988705189eeb9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br></div>Do anyone know how to overridi=
ng variables set in arago.conf using layer.conf or local.conf settings (or =
anything else that touching Arago layer). I try to set something else on my=
 own layer (PREFERRED_VERSION_u-boot). I have tried changing layer orders i=
n bblayers.conf and priority in layer.conf. In fact if I got it right from =
Yocto documentation distro.conf is just parsed first and that is what rules=
.<br></div>Thanks,<br></div>Matti<br></div>

--90e6ba3fd2815c988705189eeb9e--
