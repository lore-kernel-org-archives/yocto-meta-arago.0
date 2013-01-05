Return-Path: <paul.kovitz@welchallyn.com>
Received: from na3sys009aog115.obsmtp.com (na3sys009aog115.obsmtp.com
	[74.125.149.238])
	by arago-project.org (Postfix) with ESMTPS id 53AFC52974
	for <meta-arago@arago-project.org>;
	Sat,  5 Jan 2013 00:19:23 +0000 (UTC)
Received: from mail-pa0-f70.google.com ([209.85.220.70]) (using TLSv1) by
	na3sys009aob115.postini.com ([74.125.148.12]) with SMTP
	ID DSNKUOdxie1dHas5+gef1gq0g9nGCx8aSJTZ@postini.com;
	Fri, 04 Jan 2013 16:19:23 PST
Received: by mail-pa0-f70.google.com with SMTP id hz11so17459340pad.5
	for <meta-arago@arago-project.org>;
	Fri, 04 Jan 2013 16:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=3/x/FfScS5e5yLzdN68jT63nLBZcxoYf7ADUJbBCJo0=;
	b=f1+XPYs/1ociJTvwJGz/GYlF0TMqVW/jfxphMd/SIWfZxCE9sHJY+rHcaXxiOmsau9
	EKoLLlhDnkWRENWvrkIcr15Cr3AFqQIqmpJWl4tokugyefQq+Rzx0RJFbNZPS7elaUFb
	+VmmWrwA7eSGPIgKsIdQft1xdtgGPIpjIqGlsEIqgyzVudINkPj9r+gE2J6Twt/XoRKk
	FwQNgJsm81gTBLZia9381pcpo08UDdIY6Z2wUX0j4yzj+BqDUJd6coaqTm+khmTYGS/s
	S7ajD09qs7LAdODmDHQW4QgQ305ZlK0hiUiqt9YuJpAeJnrT4JV8bH7OlVJOSVErCyiM
	rWag==
X-Received: by 10.68.192.97 with SMTP id hf1mr166071763pbc.106.1357345161275; 
	Fri, 04 Jan 2013 16:19:21 -0800 (PST)
Received: by 10.68.192.97 with SMTP id hf1mr166071742pbc.106.1357345161113;
	Fri, 04 Jan 2013 16:19:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.155.73 with HTTP; Fri, 4 Jan 2013 16:18:40 -0800 (PST)
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Fri, 4 Jan 2013 16:18:40 -0800
Message-ID: <CA+edY+R9ONv039-fdmdqB7v+POf_ig=ea5-Zhh0=u1s8DPUecw@mail.gmail.com>
To: meta-arago@arago-project.org
X-Gm-Message-State: ALoCoQlCO7Awwb/9itPIgFLLRLVgV0YApGzuQTfmtAVlhdVJze2rvv4ckFzma61SQx5PIvg7eXD2X3qp7xra9cNu284+LhM/uELBtP9uxACSJNaugGc+XcJrOPWj+jGTp4bFNgo/aG7EfeoUJ3kv8FxPdIG5fRtdmotg48ieNfBarTRFomJzbaU=
Subject: 805 warning messages when I build 05.06.00.00?
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
X-List-Received-Date: Sat, 05 Jan 2013 00:19:24 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c8b82a6fae04d27f8c24

--e89a8ff1c8b82a6fae04d27f8c24
Content-Type: text/plain; charset=ISO-8859-1

Greetings. I am new to this list and relatively new to oe, so if this kind
of post does not belong here, please tell me.

I did a build today of the 05.06.00.00 release using this toolchain:
http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2

There seem to be several classes of warnings. I have questions about all of
them. Sorry if these were covered under a previous thread. I only went back
in the archives a few months and didn't see it.

   - Failed to fetch from some URL. I assume source was successfully gotten
   from a mirror, so I can ignore this. True?
   - File {path} from {some package} was already stripped, this will
   prevent future debugging! Is this a consequence of using a prebuilt
   toolchain? Are these compile options that I can change if I need to?
   - For recipe {some recipe name}, the following files/directories were
   installed but not shipped in any package: followed by a list of files. I
   assume this is harmless, but it adds to the build time. Is that correct?
   - QA Issue: No GNU_HASH in the elf binary: {some path} What does this
   mean? Is the code compliant with the appropriate license?
   - QA Issue: non -staticdev package contains static .a library What does
   this mean?
   - QA Issue: {some package: some path} links to something under
   exec_prefix followed by QA Issue: ldd reports: followed by a number of
   symbolic links. What does this mean?
   - TI installer requires 32bit glibc libraries for proper operation. What
   does this mean? Is my build machine Linux environment not set up properly?
   - {package name} No generic license file exists for: {License Name} in
   any provider. Is this a consequence of some automatic license detection
   software failing, or something more serious (we don't know how this code is
   licensed)?
   - QA Issue: {name}: Found a reference to /usr/ {some path} followed
   by WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should
   not reference anything in exec_prefix What does this mean?
   - QA Issue: package {name} contains bad RPATH {path} in file {path 2}
   What does this mean?

Are these all benign issues? Do any warrant me posting my cooker.log.x
file? If so, what are the rules for doing that on this list?

--Paul

--e89a8ff1c8b82a6fae04d27f8c24
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Greetings. I am new to this list and relatively new to oe, so if this kind =
of post does not belong here, please tell me.<div><br></div><div>I did a bu=
ild today of the 05.06.00.00 release using this toolchain:<div><a href=3D"h=
ttp://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/ex=
ports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2">http://software-dl.ti=
.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/arago-2011.09-=
armv7a-linux-gnueabi-sdk.tar.bz2</a><br>

<div><br></div><div>There seem to be several classes of warnings. I have qu=
estions about all of them. Sorry if these were covered under a previous thr=
ead. I only went back in the archives a few months and didn&#39;t see it.=
=A0<br>

</div><div><ul><li>Failed to fetch from some URL. I assume source was succe=
ssfully gotten from a mirror, so I can ignore this. True?<br></li><li>File =
{path}=A0from {some package} was already stripped, this will prevent future=
 debugging! Is this a consequence of using a prebuilt toolchain? Are these =
compile options that I can change if I need to?<br>

</li><li>For recipe {some recipe name}, the following files/directories wer=
e installed but not shipped in any package: followed by a list of files. I =
assume this is harmless, but it adds to the build time. Is that correct?<br=
>

</li><li>QA Issue: No GNU_HASH in the elf binary: {some path} What does thi=
s mean? Is the code compliant with the appropriate license?<br></li><li>QA =
Issue: non -staticdev package contains static .a library What does this mea=
n?<br>

</li><li>QA Issue: {some package: some path} links to something under exec_=
prefix followed by=A0QA Issue: ldd reports: followed by a number of symboli=
c links. What does this mean?<br></li><li>TI installer requires 32bit glibc=
 libraries for proper operation. What does this mean? Is my build machine L=
inux environment not set up properly?=A0<br>

</li><li>{package name} No generic license file exists for: {License Name} =
in any provider. Is this a consequence of some automatic license detection =
software failing, or something more serious (we don&#39;t know how this cod=
e is licensed)?<br>

</li><li>QA Issue: {name}: Found a reference to /usr/ {some path} followed =
by=A0WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir shoul=
d not reference anything in exec_prefix What does this mean?<br></li><li>

QA Issue: package {name} contains bad RPATH {path} in file {path 2} What do=
es this mean?</li></ul><div><div>Are these all benign issues? Do any warran=
t me posting my cooker.log.x file? If so, what are the rules for doing that=
 on this list?=A0</div>

<div><br></div><div>--Paul</div></div>
</div></div></div>

--e89a8ff1c8b82a6fae04d27f8c24--
