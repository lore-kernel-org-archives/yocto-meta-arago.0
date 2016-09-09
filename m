Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by arago-project.org (Postfix) with ESMTPS id 8A56B5298D
	for <meta-arago@arago-project.org>;
	Fri,  9 Sep 2016 16:41:19 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id l91so25974369qte.3
	for <meta-arago@arago-project.org>;
	Fri, 09 Sep 2016 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GqfIbY3uCvyrbs3lZ89a/k1yPueuzdXDx2ktwZxCziE=;
	b=curj6xbIj2hiLuMqDCYRohW3Es6Oti8AwFI/ZHwdCaaUWRuDbJqPBk85uNy4Vfv4iW
	yuPzDLc+Mt1pxgKUqapIOMyblej8Fj6SYlNMRndptUSbSNtZP/mEHzRLTJWjAow46uwH
	wRFWkvkva7tYmPHX5qEF0GEih2+g3sCFN4bvRVoGPAXc/MqHSz4paVs9ntFqLkbRD7Rz
	yZAQV+pgyTTqCbQu7ojTW7mxBGsQ3Z3/xdvjThSFJ+RG0GM354mx2ufdON06oFhwlgcE
	+RcxBj2u1KJ2W2xETMAqeQQVATUfbzRqP1LKUEa6tkr4sKjze3qk5UyrJiHCmjzk0i0l
	bCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GqfIbY3uCvyrbs3lZ89a/k1yPueuzdXDx2ktwZxCziE=;
	b=i+MfY3t4NGZyi46uhANtO4ZOYfLolgh77wg3JsjaKgKOE/QeGD4wS+7PMl+ivmRFzy
	Zk0TrTXAhZnhyRC3/PK8qUgFJEpckrvIZNHjEaaTNeN88os1q4hUss05CLvRYKLm6CoQ
	Glyr3M/C92j38QDvYr/016z8CoMB4Y/8DeKRTsj5GtVD7slFEkLUaDomAdNXP5oDRV5u
	g3PkRxScOwOy8S4kz6rFq0lgUzjLZyr+XBF+QY+lBZH0igLUvb7Pbl2qCPI4rqPx9wbL
	jVzI2svDqaBf78N7gCMY5Isobx5ctAf8fR5tp4s1zfsDtZ+M6auW+FkRtAS4LBiwIhdS
	bVFw==
X-Gm-Message-State: AE9vXwOQXaORW/DeKuh0vk3EvGL0h6vkxzQmTI0OmrZQrorPUDYX4NOkPdguU4evwf3TuJgihh9G93ACri2Z1A==
X-Received: by 10.237.49.5 with SMTP id 5mr5017079qtg.136.1473439279748; Fri,
	09 Sep 2016 09:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.148.65 with HTTP; Fri, 9 Sep 2016 09:41:19 -0700 (PDT)
In-Reply-To: <20160908180607.GD29658@edge>
References: <CADnUhn0hoi67iF9LGyoYj3LOUATyr7R8JOTMbx9o7otT-29B9w@mail.gmail.com>
	<20160908180607.GD29658@edge>
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Fri, 9 Sep 2016 19:41:19 +0300
Message-ID: <CADnUhn3Yp=4SuwJPVnGtW9Pc0EYvnXsbtZXytZ1yh0P9s+8COA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: meta-ti/krogoth status
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
X-List-Received-Date: Fri, 09 Sep 2016 16:41:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9bb2de5027053c15d0f0

--94eb2c0c9bb2de5027053c15d0f0
Content-Type: text/plain; charset=UTF-8

Great to hear, since I have had pressure getting fido replaced with krogoth
in order to get more recent NetworkManager installed.
Thanks,
Matti

2016-09-08 21:06 GMT+03:00 Denys Dmytriyenko <denys@ti.com>:

> On Thu, Sep 01, 2016 at 08:29:32PM +0300, matti kaasinen wrote:
> > Hi!
> > What is the status of meta-ti/krogoth layer at the moment?
>
> It's doing quite well, thanks for asking! :)
>
>
> > I have not seen [meta-arago] [nightly] RT Core TISDK (krogoth/2.1)
> > <http://arago-project.org/pipermail/meta-arago/2016-August/008135.html>
> > runs since Aug 4. However, latest updates in
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti?h=krogoth seems to be
> > three days old.
>
> The builds got moved to a different system and status emails are sent to
> another list for now. The plan is to have a summary status of the builds
> sent to the public list in the future, once it's available...
>
> --
> Denys
>

--94eb2c0c9bb2de5027053c15d0f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Great to hear, since I have had pressure getting=
 fido replaced with krogoth in order to get more recent NetworkManager inst=
alled.<br></div>Thanks,<br></div>Matti<br></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">2016-09-08 21:06 GMT+03:00 Denys Dmytriyenko=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">de=
nys@ti.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Thu, Sep 01, 2016 at 08:29:32PM +0300, matti kaasinen wrote:<br>
&gt; Hi!<br>
&gt; What is the status of meta-ti/krogoth layer at the moment?<br>
<br>
</span>It&#39;s doing quite well, thanks for asking! :)<br>
<span class=3D""><br>
<br>
&gt; I have not seen [meta-arago] [nightly] RT Core TISDK (krogoth/2.1)<br>
</span>&gt; &lt;<a href=3D"http://arago-project.org/pipermail/meta-arago/20=
16-August/008135.html" rel=3D"noreferrer" target=3D"_blank">http://arago-pr=
oject.org/<wbr>pipermail/meta-arago/2016-<wbr>August/008135.html</a>&gt;<br=
>
<span class=3D"">&gt; runs since Aug 4. However, latest updates in<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti?h=3Dkrogo=
th" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>c=
git/cgit.cgi/meta-ti?h=3D<wbr>krogoth</a> seems to be<br>
&gt; three days old.<br>
<br>
</span>The builds got moved to a different system and status emails are sen=
t to<br>
another list for now. The plan is to have a summary status of the builds<br=
>
sent to the public list in the future, once it&#39;s available...<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br></div>

--94eb2c0c9bb2de5027053c15d0f0--
