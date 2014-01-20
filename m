Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by arago-project.org (Postfix) with ESMTPS id 54A3F52A20
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 14:29:53 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so5011707pbb.39
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8+9OvQbYWQyhZqrE41JnY2mtx7BPsh+Hx9uJi5JgRt4=;
	b=r9qtECFSa2juODkbZC99hDV474LPJGXkD6OxhSdtHRkckcjhHQaODpG1h2DbfdXFAv
	wzrNKeUZctW4AzjAN+MzB1mZNznqVVKW54/QTro+mJiuozDxaR5YmKM7GJPgk0mddLta
	ePLfXdZTS1Mra3dtUR1RV8+sD1HeSxB9zdbj4gsgB2pQvkjxwn6/yWkXJO7uL5sRivNW
	0BzKYaSX+f+ZAJ9V4taN1i0kVO7SwX2VWu6rGnUeoToIyFYPr05HZluQ+YxTTJ3HDXf7
	zOYPaBqb9hWR0k7XxoLn5JhxG+KFFDAt1VJvm6opIaNzmuebMsUBiI6cQ8dmYNs1dQD5
	OnpQ==
MIME-Version: 1.0
X-Received: by 10.66.66.202 with SMTP id h10mr19037244pat.70.1390228192362;
	Mon, 20 Jan 2014 06:29:52 -0800 (PST)
Received: by 10.68.208.227 with HTTP; Mon, 20 Jan 2014 06:29:52 -0800 (PST)
Date: Mon, 20 Jan 2014 16:29:52 +0200
Message-ID: <CADnUhn0GG7AByt0bWeqkCtVWxNxr66-8m16-YaxnM-S4aw5B4w@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: ubifs crossupport between Linux and U-Boot
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
X-List-Received-Date: Mon, 20 Jan 2014 14:29:53 -0000
Content-Type: multipart/alternative; boundary=001a1134a8669003e304f067b9be

--001a1134a8669003e304f067b9be
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I Have been using Angstrom distribution for my beaglebone (+ nand flash)
based board. Problem with Angstrom baked Linux/U-boot images is that
whereas both support ubifs partition on nand flash they both seem to handle
it in their own ways. Does Aragon distribution have this same problem?

Cheers,
Matti

--001a1134a8669003e304f067b9be
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br><br></div>I Have been using Angstrom=
 distribution for my beaglebone (+ nand flash) based board. Problem with An=
gstrom baked Linux/U-boot images is that whereas both support ubifs partiti=
on on nand flash they both seem to handle it in their own ways. Does Aragon=
 distribution have this same problem?<br>
<br></div>Cheers,<br></div>Matti <br></div>

--001a1134a8669003e304f067b9be--
