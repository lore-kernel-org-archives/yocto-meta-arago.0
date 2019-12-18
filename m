Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by arago-project.org (Postfix) with ESMTPS id 33B83529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 04:45:48 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id f15so631539lfl.13
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 20:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XZGo1YMQW67SHwWs7XF2SsoZBRzY16aIGXcTDid/4Bw=;
	b=jRdxGpg4mHSaDsRcQygTdbn7gl4n/KO5ehhhHA+STKCoeUYvtTyBFrNkctwYKKYt+R
	qzh0kn3s8h2foMcdVA0rAGDZG1nsNHX89izeBHbDAtZAoz13n/kFjjIPX7H6xWb5CWd5
	AI3yWR9ecv4/Yg7cPsDNUF2S8CdVIIxDxY2lytvruPTI5luglVWcotv+Y87y1LVeKAF2
	PB/WUKXkD+tpFLXKKEWKB/CG1Eh7gKrBH6baWFkyH2UvU3hzLovOgNBi6SWWwc/JtThG
	kdNtuh5xAX6wOQXEjweorD7bW/i4BzHUuct4/ana4BmBTV7BVxcQxGdqehU1A5XpmYQn
	qKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XZGo1YMQW67SHwWs7XF2SsoZBRzY16aIGXcTDid/4Bw=;
	b=dvwFFweqoQPZzG8zKM10GMEaTbFXr6CzWsmFiEPFwa/Oh0YksEcGSRnUmkfJuAdjAg
	ir3xvvepC5u9TYaUiz0EviIZNAILhimO3/ODPhj/lgb0ZcZ5Gjn3AKXlVbbv9TjOcsXA
	lOImB1BQ49sw7uvWFOpPq2pUoa01RvYF3CgdYqYakhUsOrIXN0T4tZf/9ALptHigb3Bj
	lxfEK/50THtQBuGFhR0hVlVCR5lzyLu0ZfnwIAsIAB85q/+DUHUPQbHFnX+e5BrdNQsh
	XBs5t/Mk4EFbbs0RwAawCbYJBagcJg96zMeJ8kHvvkWR9j0Kr0Gpf2BDYWncfZmQnixT
	9cKQ==
X-Gm-Message-State: APjAAAXXjYL42CFNUw/nQs3HG1BBnVPO+qwSn8526QbOmcJesqrr2eIr
	4WQphcj3jY2091a6MeEeLQxUgYbjWVkQlpl+Dww=
X-Google-Smtp-Source: APXvYqzf0QL9NjOmK2+grTZIIj2vlLpsDDJyK+LjxbRgk2BZ4f2hHDxL2tJJ0rmpHRjqO+3IB65rYt4I6R+83TbAbiI=
X-Received: by 2002:ac2:485c:: with SMTP id 28mr370939lfy.118.1576644250418;
	Tue, 17 Dec 2019 20:44:10 -0800 (PST)
MIME-Version: 1.0
References: <20191218022431.11153-1-denys@ti.com>
In-Reply-To: <20191218022431.11153-1-denys@ti.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 18 Dec 2019 17:43:59 +1300
Message-ID: <CADySD0GVPZY0obXjcmmCJ9UjZMXGW_NGY-WVQUAfka44CdGuRw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] external-arm-toolchain: strip binaries and libraries normally
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
X-List-Received-Date: Wed, 18 Dec 2019 04:45:48 -0000
Content-Type: multipart/alternative; boundary="0000000000007bc1160599f31851"

--0000000000007bc1160599f31851
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

I have sent a similar patch to meta-linaro (though haven't heard back).
Shouldn't it be ideally fixed there rather than in bbappends?

regards
Ankur

On Wed, 18 Dec 2019, 3:43 p.m. Denys Dmytriyenko, <denys@ti.com> wrote:

> Similar to external-linaro-toolchain before:
> b019da9374256b671a2fb77ccfae7e3f1ef3096b
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/meta/external-arm-toolchain.bbappend          | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git
> a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> index a5d63297..b88c337d 100644
> --- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> @@ -1,3 +1,6 @@
> +INHIBIT_PACKAGE_STRIP = "0"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "0"
> +
>  ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' +
> d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
>
>  do_install_append() {
> --
> 2.17.1
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>

--0000000000007bc1160599f31851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Denys,<div dir=3D"auto"><br></div><div dir=3D"auto">I =
have sent a similar patch to meta-linaro (though haven&#39;t heard back).</=
div><div dir=3D"auto">Shouldn&#39;t it be ideally fixed there rather than i=
n bbappends?</div><div dir=3D"auto"><br></div><div dir=3D"auto">regards</di=
v><div dir=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 18 Dec 2019, 3:43 p.m. Denys Dmytriy=
enko, &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Similar to external-linaro-toolchain bef=
ore:<br>
b019da9374256b671a2fb77ccfae7e3f1ef3096b<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank" rel=3D"noreferrer">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/meta/external-arm-toolchain.bbappend=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bba=
ppend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend=
<br>
index a5d63297..b88c337d 100644<br>
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend<b=
r>
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend<b=
r>
@@ -1,3 +1,6 @@<br>
+INHIBIT_PACKAGE_STRIP =3D &quot;0&quot;<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;0&quot;<br>
+<br>
=C2=A0ORIG_TARGET_SYS =3D &quot;${TARGET_ARCH}${TARGET_VENDOR}${@[&#39;-&#3=
9; + d.getVar(&#39;TARGET_OS&#39;), &#39;&#39;][d.getVar(&#39;TARGET_OS&#39=
;) =3D=3D (&#39;&#39; or &#39;custom&#39;)]}&quot;<br>
<br>
=C2=A0do_install_append() {<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank" rel=3D"no=
referrer">meta-arago@arago-project.org</a><br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://arago-project.org/cgi-=
bin/mailman/listinfo/meta-arago</a><br>
</blockquote></div>

--0000000000007bc1160599f31851--
