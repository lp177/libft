/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strput.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: luperez <luperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/03 05:43:31 by luperez           #+#    #+#             */
/*   Updated: 2014/12/06 12:46:04 by luperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_str	*strput(t_str *str, char *value)
{
	str->str = value;
	return (str->next);
}
