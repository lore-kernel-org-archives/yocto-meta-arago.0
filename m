Return-Path: <timothy.godfrey@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by arago-project.org (Postfix) with ESMTPS id C121752975
	for <meta-arago@arago-project.org>;
	Thu, 17 May 2018 06:39:22 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id p5-v6so4360560wre.12
	for <meta-arago@arago-project.org>;
	Wed, 16 May 2018 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=UqEZaQsVFaeEmxL6jsdXJmUoAxtB84EQ5sKq6dj2sgs=;
	b=Ro6ZfmLxVz9HacRaHZb5adZqAiUTEdaWK3gKfhqhmg36Ov3+6fU0bbTvVpqTXB/Zjb
	k4vBC5MOQNy5zVcOD8C4qP3hqjKlL9LUvCVhvs3uF8u7LDlEdXgzjSsWEsjNf5hR75il
	qdLYBlNklmTLwLozUsteW0uR5RilE8lMnB8OJShe1knNLKn9gLOsV4pU2cbTxUOUhyDK
	DDnmS9xob5MwYiLbUBtyFiVEtKfBmvlQJzvxbbhiR9nmS9yJMPSFxWtHfbTvMY8nL1K7
	Miguq/WghYng9H6GVGxJnjIcy9z1DV9ipghj9P5+JNEdEVya6Dz1RWlG1m3Qc9L4qmyJ
	q5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=UqEZaQsVFaeEmxL6jsdXJmUoAxtB84EQ5sKq6dj2sgs=;
	b=r+jz61znajTOCBAptRslQyu+HbMb86eUSu/TxvO5SwzhajmSc3ZpVxWl3P59iEkOlF
	wv+1EiVWVif7s8NFPFBiDCGoXoL+o9NzO3tlmVFQS7DOC+mCMBY+1QGOBYTqFm9YiYqI
	2Zd6Mi57bIutftvVrjte3tUqbGb3hDtatqdhsrwk+qPK9+/MVxXBCqeeekvP0WZVFEWP
	PfsRLFZa7JNtsiytymlqOKd8E59yChAbAtdbTEdsg3joebTxDakxNxr6XUsjH6upIYSk
	y5aCjKzl+ShR+J1sS1bkFx7zLE7ygDo+ftsNwU/+cqSJj5DShXCBgJRJRZswuf4ELWIT
	+zDg==
X-Gm-Message-State: ALKqPwfKVKYwFBdCPpjrxqTL5Uf26mObZDnFGpSN4CQarUB/48MQUMQs
	Xj7X6f3oMPYevJ7HNYLTetZ/PjqqOcdcO1jtcCf5
X-Google-Smtp-Source: AB8JxZpIem9K4yke//CJwQrxoDZnjUP9z7qNcIr4nzHPaDpfy80Na8gRgdO5FuayICkD8MnNxLcKZfMJiO1cY3s0Np4=
X-Received: by 2002:adf:8e44:: with SMTP id
	n62-v6mr3013153wrb.159.1526539157516; 
	Wed, 16 May 2018 23:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.65.6 with HTTP; Wed, 16 May 2018 23:39:16 -0700 (PDT)
In-Reply-To: <CAHb6uwfOE-EHqsxARvXCETWRwfyVg-2o1qWV0K15AGW8MWZo6A@mail.gmail.com>
References: <CAHb6uwfOE-EHqsxARvXCETWRwfyVg-2o1qWV0K15AGW8MWZo6A@mail.gmail.com>
From: Tim Godfrey <timothy.godfrey@gmail.com>
Date: Thu, 17 May 2018 16:39:16 +1000
Message-ID: <CAHb6uwd=VXw13U7MmhFU_S7Afr75U3rY2v4L=yjTCk3HbmahYA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: TI unpack task not returning/exiting
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
X-List-Received-Date: Thu, 17 May 2018 06:39:23 -0000
Content-Type: multipart/alternative; boundary="000000000000383651056c6118a3"

--000000000000383651056c6118a3
Content-Type: text/plain; charset="UTF-8"

I have had a further look into the installer, and it doesn't actually exit
even though it prints

"Setup has finished installing C6000 Code Generation Tools on your
computer."

Using the installer options "--unattendedmodeui minimal --prefix
/some/directory" didn't make the installer run in 'non-interactive' mode,
neither did it help getting the installer to exit. Still looking into it;
any suggestions warmly received.

Thanks!
Tim

On Thu, May 17, 2018 at 4:11 PM, Tim Godfrey <timothy.godfrey@gmail.com>
wrote:

> Hello!
>
> I raised this question on the bitbake-devel mailing list, because I
> thought it might have been a problem with bitbake or the underlying Python
> task. Somebody helpfully replied and suggested that it might be because of
> the called setup wizard waiting for input. I have run the installer myself
> directly and it exits without waiting for a keypress or the like, so I'm a
> bit stuck. Considering that it is a TI binary installer I wondered whether
> the arago list is a better place to ask the question. Apologies for the
> cross/re posting.
>
> A recipe I am working with hangs on the do_unpack task. Looking at the
> logs, the sub-task appears to complete successfully, but the calling task
> doesn't complete, and the overall bitbake build process doesn't either.
>
> This is the complete log for the do_unpack task:
>
> DEBUG: Executing python function do_unpack
> DEBUG: Executing python function base_do_unpack
> NOTE: Unpacking /home/tim/tisdk/downloads/ti_c
> gt_c6000_8.2.2_linux_installer_x86.bin to /home/tim/tisdk/build/arago-tm
> p-external-linaro-toolchain/work/x86_64-nativesdk-arago-linu
> x/nativesdk-ti-cgt6x/1_8.2.2-r0/
> DEBUG: Python function base_do_unpack finished
> DEBUG: Executing python function ti_bin_do_unpack
> ------------------------------------------------------------
> ----------------
> Welcome to the C6000 Code Generation Tools Setup Wizard.
>
> ------------------------------------------------------------
> ----------------
> Select Installation Directory
>
> Please specify the directory where C6000 Code Generation Tools will be
> installed. The installation requires 264592 KB.
>
> Destination Directory [/home/tim/tisdk/build/arago-t
> mp-external-linaro-toolchain/work/x86_64-nativesdk-arago-lin
> ux/nativesdk-ti-cgt6x/1_8.2.2-r0/ti-cgt6x-8.2.2/ti-cgt-c6000_8.2.2]:
> ------------------------------------------------------------
> ----------------
> Setup is now ready to begin installing C6000 Code Generation Tools on your
> computer.
>
> Do you want to continue? [Y/n]:
> ------------------------------------------------------------
> ----------------
> Please wait while Setup installs C6000 Code Generation Tools on your
> computer.
>
>  Installing
>  0% ______________ 50% ______________ 100%
>  #########################################
>
> ------------------------------------------------------------
> ----------------
> Setup has finished installing C6000 Code Generation Tools on your computer.
>
> The cooker log includes this line:
>
> NOTE: recipe nativesdk-ti-cgt6x-1_8.2.2-r0: task do_unpack: Started
>
> but there is no corresponding 'Succeeded' line in the log. I'm guessing it
> has something to do with the ti_bin_do_unpack task not returning to the
> calling do_unpack task.
>
> Is this a known problem? Is there a known solution to it? On a related
> point, if I would like to call the python tasks directly in order to
> troubleshoot the problem, is there a standard/easy way to do that?
>
> All input warmly received, thanks!
> Tim
>

--000000000000383651056c6118a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have had a further look into the installer, and it =
doesn&#39;t actually exit even though it prints <br></div><div><br></div><d=
iv>&quot;Setup has finished installing C6000 Code Generation Tools on your =
computer.&quot;</div><div><br></div><div>Using the installer options &quot;=
--unattendedmodeui minimal --prefix /some/directory&quot; didn&#39;t make t=
he installer run in &#39;non-interactive&#39; mode, neither did it help get=
ting the installer to exit. Still looking into it; any suggestions warmly r=
eceived.</div><div><br></div><div>Thanks!</div><div>Tim<br></div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 17, 2018 =
at 4:11 PM, Tim Godfrey <span dir=3D"ltr">&lt;<a href=3D"mailto:timothy.god=
frey@gmail.com" target=3D"_blank">timothy.godfrey@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><d=
iv><div><div>Hello!<br><br></div>I raised this question on the bitbake-deve=
l mailing list, because I thought it might have been a problem with bitbake=
 or the underlying Python task. Somebody helpfully replied and suggested th=
at it might be because of the called setup wizard waiting for input. I have=
 run the installer myself directly and it exits without waiting for a keypr=
ess or the like, so I&#39;m a bit stuck. Considering that it is a TI binary=
 installer I wondered whether the arago list is a better place to ask the q=
uestion. Apologies for the cross/re posting.<br></div><div><br></div><div>A=
 recipe I am working=20
with hangs on the do_unpack task. Looking at the logs, the sub-task=20
appears to complete successfully, but the calling task doesn&#39;t complete=
, and the=20
overall bitbake build process  doesn&#39;t either. <br><br></div>This is th=
e complete log for the do_unpack task:<br><br>DEBUG: Executing python funct=
ion do_unpack<br>DEBUG: Executing python function base_do_unpack<br>NOTE: U=
npacking /home/tim/tisdk/downloads/ti_c<wbr>gt_c6000_8.2.2_linux_installer<=
wbr>_x86.bin to /home/tim/tisdk/build/arago-tm<wbr>p-external-linaro-toolch=
ain/wo<wbr>rk/x86_64-nativesdk-arago-linu<wbr>x/nativesdk-ti-cgt6x/1_8.2.2-=
<wbr>r0/<br>DEBUG: Python function base_do_unpack finished<br>DEBUG: Execut=
ing python function ti_bin_do_unpack<br>------------------------------<wbr>=
------------------------------<wbr>----------------<br>Welcome to the C6000=
 Code Generation Tools Setup Wizard.<br><br>------------------------------<=
wbr>------------------------------<wbr>----------------<br>Select Installat=
ion Directory<br><br>Please specify the directory where C6000 Code Generati=
on Tools will be <br>installed. The installation requires 264592 KB.<br><br=
>Destination Directory [/home/tim/tisdk/build/arago-t<wbr>mp-external-linar=
o-toolchain/w<wbr>ork/x86_64-nativesdk-arago-lin<wbr>ux/nativesdk-ti-cgt6x/=
1_8.2.2-<wbr>r0/ti-cgt6x-8.2.2/ti-cgt-c6000<wbr>_8.2.2]: <br>--------------=
----------------<wbr>------------------------------<wbr>----------------<br=
>Setup is now ready to begin installing C6000 Code Generation Tools on your=
 <br>computer.<br><br>Do you want to continue? [Y/n]: <br>-----------------=
-------------<wbr>------------------------------<wbr>----------------<br>Pl=
ease wait while Setup installs C6000 Code Generation Tools on your computer=
.<br><br>=C2=A0Installing<br>=C2=A00% ______________ 50% ______________ 100=
%<br>=C2=A0#############################<wbr>############<br><br>----------=
--------------------<wbr>------------------------------<wbr>---------------=
-<br>Setup has finished installing C6000 Code Generation Tools on your comp=
uter.<br><br></div>The cooker log includes this line:<br><br>NOTE: recipe n=
ativesdk-ti-cgt6x-1_8.2.2-r0: task do_unpack: Started<br><br></div>but
 there is no corresponding &#39;Succeeded&#39; line in the log. I&#39;m gue=
ssing it=20
has something to do with the ti_bin_do_unpack task not returning to the=20
calling do_unpack task. <br><br></div>Is this a known problem? Is there a
 known solution to it? On a related point, if I would like to call the=20
python tasks directly in order to troubleshoot the problem, is there a=20
standard/easy way to do that?<br><br></div><div>All input warmly received, =
thanks!</div><span class=3D"HOEnZb"><font color=3D"#888888"><div>Tim<br></d=
iv></font></span></div>
</blockquote></div><br></div>

--000000000000383651056c6118a3--
