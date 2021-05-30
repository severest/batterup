export const query = (query, variables) => {
  const csrfToken = document.querySelector('meta[name=csrf-token]').getAttribute('content')
  return fetch('/graphql', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
      'X-CSRF-Token': csrfToken,
    },
    body: JSON.stringify({ query, variables }),
  })
    .then(r => r.json())
    .then(data => {
      if (data.errors) {
        throw data.errors[0].message
      } else {
        return data
      }
    })
}
