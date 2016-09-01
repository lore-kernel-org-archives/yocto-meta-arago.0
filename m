Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by arago-project.org (Postfix) with ESMTPS id 8FA8C52A69
	for <meta-arago@arago-project.org>;
	Thu,  1 Sep 2016 17:29:33 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id 11so33107798qtc.0
	for <meta-arago@arago-project.org>;
	Thu, 01 Sep 2016 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=45LN5wsiRqE/xDoUPwclBuxtAFm5BudmIzjMxdW0E/o=;
	b=TkXom7TIkwCCcuuidahDFtBBYSVokSfr8BJanjZLRGnIqJwufJeJFXXBbX3YbxAD4c
	SF5fgXV71SE0D3HOcGP3WJsQToK6aHrrQvSPRM3WZvMotynYXUW4JpBegOCqnVeKiRYX
	qHteuKHjFPZJQ2syltA0Y1UPTciTovFv24f64XyJTsQtig5NJGyvmThDn2EI/ztx5Edm
	AFm3cJvxnAuh7WpT1A0fQnRT+kkgvQUqzMEF5zfWHdq0+Qd/ZhUmf8OWrGPrH0hlwNMn
	tfkDSk3b3fElZNNDrU8+2OsTMLggU3/dvZU8fi45QUbj3aZ0qVUYGMVJo3JA7qdL9TDJ
	HRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=45LN5wsiRqE/xDoUPwclBuxtAFm5BudmIzjMxdW0E/o=;
	b=LuRnxiaJZ4+9WVwQigAW+cMbfiM76wNK8bG15ngy7yxJ0nXcIQOEvX9oyff+4iC4n7
	U80zwZL6VrLC2j/bZwIt9P3mxSoHvayaRXwGUckEEKfjMabLBMnJLA/RDEwa+u7cWwNS
	BXetRsjpbGpQtjMQU56LJKM7Z3qLSP1HMnFO4+IU4lPC83FosxdB+KOZaCsuWbj/m13Y
	Qh5o6ajFakgLngPI8wWNm/F80m1hmQcOKULf4cg7jwxx8pZLG63qDBVGnUrYofhgklit
	F8y6bAbu02VQBEX6S7HcDiriyjJ0tuxDF2b9qH+STzgwBfp4Q+e1CGfdQPhzpIrxNt0M
	r7Ng==
X-Gm-Message-State: AE9vXwN/kg99QtKgsP0MFd5ZVztKItz2AygQDLG/9FjNTcXJe4fPT+0DASNwOUIMT6l1ghAklayeP48GS8Vz9w==
X-Received: by 10.200.53.171 with SMTP id k40mr9294579qtb.47.1472750973198;
	Thu, 01 Sep 2016 10:29:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.122.196 with HTTP; Thu, 1 Sep 2016 10:29:32 -0700 (PDT)
From: matti kaasinen <matti.kaasinen@gmail.com>
Date: Thu, 1 Sep 2016 20:29:32 +0300
Message-ID: <CADnUhn0hoi67iF9LGyoYj3LOUATyr7R8JOTMbx9o7otT-29B9w@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: meta-ti/krogoth status
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
X-List-Received-Date: Thu, 01 Sep 2016 17:29:34 -0000
Content-Type: multipart/alternative; boundary=001a113e5a9c99a8e9053b758e94

--001a113e5a9c99a8e9053b758e94
Content-Type: text/plain; charset=UTF-8

Hi!
What is the status of meta-ti/krogoth layer at the moment? I have not
seen [meta-arago]
[nightly] RT Core TISDK (krogoth/2.1)
<http://arago-project.org/pipermail/meta-arago/2016-August/008135.html>
runs since Aug 4. However, latest updates in
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti?h=krogoth seems to be
three days old.

Thanks,
Matti

--001a113e5a9c99a8e9053b758e94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br></div>What is the status of meta-ti/=
krogoth layer at the moment? I have not seen <a href=3D"http://arago-projec=
t.org/pipermail/meta-arago/2016-August/008135.html">[meta-arago] [nightly] =
RT Core TISDK (krogoth/2.1)</a> runs since Aug 4. However, latest updates i=
n <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti?h=3Dkrogoth"=
>http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti?h=3Dkrogoth</a> seems to=
 be three days old.<br><br></div>Thanks,<br></div>Matti<br></div>

--001a113e5a9c99a8e9053b758e94--
