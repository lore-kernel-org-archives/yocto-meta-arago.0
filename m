Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by arago-project.org (Postfix) with ESMTPS id 03CB1529E0
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 09:08:54 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id y22so622658oti.10
	for <meta-arago@arago-project.org>;
	Fri, 06 Nov 2020 01:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fFp9fRfbnPDn5DJaSrgPhymGjnXGSzAhv65MUiOiwLU=;
	b=ftuoyvK495uaPU5hqKHQSfW6civxOwK+317sPDrbttxRO7hOha4o1SkOFNi9evoPEv
	QWlV+YLY3U/Pg5Ia2nQ2ahleWlyNSy80pDgeebDV2SKXiZe+W6yNlNN03Hfn0464vYsb
	vDTYhcsCc1G0mnA2JdHl58F6K0pHtJzK7owuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fFp9fRfbnPDn5DJaSrgPhymGjnXGSzAhv65MUiOiwLU=;
	b=D4lYGhKtmIhQMqCTNFYRYQZies1RtUAcfAFcZLPqYFTdCBuxITFIfxdI8H/fWrs6/p
	pdxZFqWOC7rZm2mI9MJT2uINXakI91fbJFBBfiW1upZNA4cJ9iMgR+/5oqD7A7kabSGz
	5VFwJHzv/SLLNT/pjO9rd0d6dEpMyoUg7DN/Gq4kGuYQ6hgzj9zVYjegWzo7/HzvDcwj
	NdlmJiRHxiTXNJkNGUEeSVJV67mJ8zFZLvXiKZurZAez9M8WtaI0pZjtoIXMrHz8VsI0
	H06NWyMxsIrCX06JBPnyxMxOKErqnKiWZtBdAVyBkx1zalC9Efi3Gre6HBbKiFqPMsEa
	gWRw==
X-Gm-Message-State: AOAM533BCLl0kt3QMz+wOGytiKYgmj6sIv/GvDfJqNg3V0PqcwDN3YiG
	MeAvdj5JCm8pAdI9M5T1FUyKbQeoC5TMZmfjmHWl5w==
X-Google-Smtp-Source: ABdhPJyr0BIfOLyure+M5wS+IoaSzRsicCceBIoRR3N5DKbl54qLp8GQQz9XaBxN/vFzaWk+r5QQxU1NOMV9+i901JI=
X-Received: by 2002:a05:6830:831:: with SMTP id
	t17mr535310ots.92.1604653545928; 
	Fri, 06 Nov 2020 01:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
In-Reply-To: <a545abad45834306b42868c6987b11dd@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Fri, 6 Nov 2020 09:05:36 +0000
Message-ID: <CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
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
X-List-Received-Date: Fri, 06 Nov 2020 09:08:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2020 at 22:54, Tammana, Gowtham <g-tammana@ti.com> wrote:
>
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
> >project.org> On Behalf Of Paul Barker
> >Sent: Thursday, November 05, 2020 4:38 AM
> >To: meta-arago@arago-project.org
> >Subject: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
> >demos: Allow empty package
> >
> >The matrix-gui-pm-demos recipe splits its binaries into several
> >subpackages leaving the default package empty. The dependencies for the
> >default package are set so it makes sense to allow this empty package to
> >be created.
> >
> >Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >---
> > meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >demos_2.0.bb
> >index 0116f5ea..a9ebb84f 100644
> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> >@@ -10,6 +10,7 @@ S = "${WORKDIR}/git/power_apps"
> >
> > # Make sure power submenu and app images has been installed
> > RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power
> >matrix-gui-generic-pm"
> >+ALLOW_EMPTY_${PN} = "1"
>
> Just curious, I assume that the deployment of the dependent packages is still
> ensured even without this change. This just makes it apparent to the user that
> the default package is empty. Or is it that the deployment of dependent packages
> is broken without this.

Without this change the matrix-gui-pm-demos package is not created and
cannot be installed.

-- 
Paul Barker
Konsulko Group

